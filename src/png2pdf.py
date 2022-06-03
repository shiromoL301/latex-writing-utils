import os
import img2pdf
from PIL import Image

if __name__ == '__main__':
    cwd = os.getcwd()
    pdf_dir_path = f"{cwd}/assets/pdf/"
    png_dir_path = f"{cwd}/assets/png/"

    for png_filename in os.listdir(png_dir_path):
        pdf_filename = png_filename.replace('.png', '.pdf')

        if pdf_filename in os.listdir(pdf_dir_path):
            continue

        with open(pdf_dir_path + pdf_filename, "wb") as f:
            f.write(img2pdf.convert(
                Image.open(png_dir_path + png_filename).filename
            ))
