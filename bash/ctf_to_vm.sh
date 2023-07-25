# Copies the ctf challenge to the vm at the specified directory
# Needs the following env variables:
#   VM_ADDR
#   VM_SRC - default will be /Users/<user>/Downloads
#   VM_DST - default will be /home/<user>/Desktop

# Most recently downloaded folder / file
FILENAME="${VM_SRC}/$(ls -t "$VM_SRC" | head -n 1)"
echo "$FILENAME"

scp -r "$FILENAME" naturia@"$VM_ADDR":"$VM_DST"

