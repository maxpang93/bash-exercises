import tarfile
import uuid
import os
import random

def generate_tar_file(output_tar_path, num_files):
    temp_dir = "temp_files"
    os.makedirs(temp_dir, exist_ok=True)

    try:
        for _ in range(num_files):
            file_name = str(uuid.uuid4())  # Generate random UUID
            file_path = os.path.join(temp_dir, file_name)
            
            # Randomly decide if the file should be empty
            if random.choice([True, False]):
                open(file_path, "w").close()  # Create an empty file
            else:
                with open(file_path, "w") as f:
                    f.write("This is a non-empty file.")  # Add some content

        with tarfile.open(output_tar_path, "w") as tar:
            tar.add(temp_dir, arcname=".")

    finally:
        # Clean up temporary files
        for file in os.listdir(temp_dir):
            os.remove(os.path.join(temp_dir, file))
        os.rmdir(temp_dir)


if __name__ == "__main__":
    generate_tar_file("archive.tar", 100)
