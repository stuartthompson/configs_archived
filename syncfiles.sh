if [ X"$1" = X"-e" ]
then
  # Sync files
  echo "Syncing files with home directory."
  rsync -av --exclude=.git --exclude=README.md --exclude=LICENSE.md --exclude=syncfiles.sh ./ ~ 
else
  # Execute flag not found, do a dry run
  echo "Performing a dry run. Add -e to execute the sync."
  rsync -anv --exclude=.git --exclude=README.md --exclude=LICENSE.md --exclude=syncfiles.sh . ~
fi
