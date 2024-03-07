#!/bin/bash

# Main directory, this is where compressed files will live.
main_dir='/tmp/invoices-vault'

# Creates main directory if it does not exist.
if [ ! -d "$main_dir" ]; then
  mkdir "$main_dir";
fi

# Use find + regex to get files that matches this pattern: invoice_<<YYYYmmdd_xxx>>.txt,
# then loop through each file that matched the pattern (they come with their absolute path).
for i in `find / -type f -regextype posix-extended -regex '^.*invoice_[0-9]{8}_[0-9]{3}\.txt'`
do
  # Get the year and month (YYYY-mm) from each filename.
  file_date=$(echo $(basename "$i") | cut -d '_' -f 2)
  formatted_date=$(date --date="$file_date" +'%Y-%m')

  # Creates YYYY-mm directory if it does not exit.
  if [ ! -d "$main_dir/$formatted_date" ]; then
    mkdir "$main_dir/$formatted_date";
  fi

  # Moves file to corresponding YYYY-mm directory (which is inside main dir).
  mv "$i" "$main_dir/$formatted_date";
done

# Gets all YYYY-mm directories inside main dir.
filtered_invoices=$(find "$main_dir" -mindepth 1 -maxdepth 1 -type d -exec basename {} \;)

# Loop through all YYYY-mm directories, then tarball and compress them with gzip.
for f in $filtered_invoices
do
  tar -cvzf "$main_dir/$f.tgz" "$main_dir/$f";
  rm -rf "$main_dir/$f"
done

echo "Run successfully, if any files were found then they were compressed at $main_dir."