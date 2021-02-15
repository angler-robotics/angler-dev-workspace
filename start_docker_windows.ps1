$SCRIPT = $MyInvocation.MyCommand.Path
$DIR = Split-Path $SCRIPT -Parent
$USER="aquadrone"
$IP = (
    Get-NetIPConfiguration |
    Where-Object {
        $_.IPv4DefaultGateway -ne $null -and
        $_.NetAdapter.Status -ne "Disconnected"
    }
).IPv4Address.IPAddress
$DISPLAY=":0.0"

$IMAGE_NAME = "aquadrone_latest"
$CONTAINER_NAME = "aquadrone_latest_$USER"
echo "Using container: $CONTAINER_NAME"
echo "User Args: $DOCKER_USER_ARGS"
echo "IP: $IP"

$DOCKER_PS = docker container ps
$DOCKER_EXISTS = "$DOCKER_PS".Contains("$CONTAINER_NAME")

if ($DOCKER_EXISTS)
{
	echo "Starting shell in running container: $CONTAINER_NAME"
	docker exec -it --workdir /home/aquadrone --env USER=aquadrone --user aquadrone ${CONTAINER_NAME} bash -l -c "stty cols $(tput cols); stty rows $(tput lines); bash"

}
else
{
	echo "Starting new container with name: $CONTAINER_NAME"
	echo $DIR":/home/aquadrone"
	docker run `
	-it --rm `
	-e DISPLAY="$IP$DISPLAY" `
	-v $DIR":/home/aquadrone" `
	--workdir /home/aquadrone `
	--user root `
	--name ${CONTAINER_NAME} `
	$IMAGE_NAME
	#docker run -v "$PSScriptRoot\:/home/${USER}" --user root --name ${CONTAINER_NAME} --workdir /home/$USER --net host $IMAGE_NAME 
}

<#
FOR /F "tokens=* USEBACKQ" %%F IN (`docker container ps`) DO (
SET DOCKER_PS=%%F
)

echo."%CONTAINER_NAME%" | findstr /C:"%DOCKER_PS%">nul && (
	echo "Starting shell in running container: %CONTAINER_NAME%"
	docker exec -it --workdir /home/aquadrone --env USER=aquadrone --user aquadrone %CONTAINER_NAME% bash -l -c "stty cols $(tput cols); stty rows $(tput lines); bash"

) || (
	echo "Starting new container with name: %CONTAINER_NAME%"
	$DOCKER_COMMAND run \
	$DOCKER_USER_ARGS \
	$DOCKER_GPU_ARGS \
	$DOCKER_SSH_AUTH_ARGS \
	-v "$DIR:/home/${USER}" \
	$ADDITIONAL_FLAGS --user root \
	--name ${CONTAINER_NAME} --workdir /home/$USER \
	--cap-add=SYS_PTRACE \
	--cap-add=SYS_NICE \
	--net host \
	--device /dev/bus/usb \
	$IMAGE_NAME 
)
#>