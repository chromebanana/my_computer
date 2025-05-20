import fnmatch
import os
import time


def delete_old_files(directory, thresholds, default_threshold):
    current_time = time.time()

    for filename in os.listdir(directory):
        file_path = os.path.join(directory, filename)
        if os.path.isfile(file_path):
            file_modified_time = os.path.getmtime(file_path)
            matched = False
            for pattern, days_threshold in thresholds.items():
                if fnmatch.fnmatch(filename, pattern):
                    matched = True
                    threshold = current_time - (
                        days_threshold * 24 * 60 * 60
                    )  # Convert days to seconds
                    if file_modified_time < threshold:
                        os.remove(file_path)
                        print(f"Deleted: {file_path}")
            if not matched and file_modified_time < (
                current_time - (default_threshold * 24 * 60 * 60)
            ):
                os.remove(file_path)
                print(f"Deleted: {file_path}")


downloads_folder = "/Users/william.cragg/Downloads"
thresholds = {
    "moonlander_will_*.bin": 1  # Delete .bin files that begin with 'moonlander_will_' after 1 day
}
default_threshold = 7  # Delete files that do not match any patterns after 30 days

delete_old_files(downloads_folder, thresholds, default_threshold)
