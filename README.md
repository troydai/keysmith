# Key Smith

**Disclaimer: This container is for demo purposes. It would be best if you did not use it in any production environment. For this reason, I don't provide any other configuration for cipher or X.509 options. The key is an elliptic curve key on the P-521 curve. The certificate is valid for 30 days. I may change any of these parameters at any moment.**

## Usage

The keysmith is a docker image that creates a private key and derives a self-signed X.509 certificate. Its primary utilization is to simplify the process of certificate-generating in many demo projects.

Once a container of this image starts, it runs a one-off operation and places three generated files under the specified output directory. The three files are:
- A private key in PEM format
- An X.509 certificate in PEM format
- A released note

## Configuration

You can configure the operation through two environment variables:
- `OUTPUT_DIR`: the directory to place the output files, usually a mounted directory allowing users to extract the certificate and private key.
- `CN_SUBJECT`: the subject of the X.509 certificate to generate.

## Examples

- [Run as a local container](/examples/local)
- [Run as an init container in Kubernetes Pod](/examples/initCointainer)