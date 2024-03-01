from setuptools import find_packages, setup

try:
    with open("requirements.txt", "r") as f:
        install_requires = [x.strip() for x in f.readlines()]
except IOError:
    install_requires = []


with open("README.md", "r") as fh:
    long_description = fh.read()

setup(
    name="sendmail-container",
    version="0.2.4",
    description="API for sending emails with POST request",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/Clinical-Genomics/sendmail-container",
    author="Maria Ropat",
    author_email="maria.ropat@scilifelab.se",
    install_requires=install_requires,
    packages=find_packages(),
    include_package_data=True,
    zip_safe=False,
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires=">=3.7",
)
