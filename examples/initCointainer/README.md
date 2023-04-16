# Execute the keysmith as an init container

This example demonstrates using a keysmith container to bootstrap the CA certificate and private key creation as an init container in a Kubernetes Pod.

## Usage

At the root of this repository

```
$ ./examples/initContainer/run.sh
Build up the pod ...
namespace/keysmith-example created
pod/keysmith-example-pod created

Waiting for example pod to be ready...
pod/keysmith-example-pod condition met

Read certificate from pod ...
-----BEGIN CERTIFICATE-----
MIICujCCAhygAwIBAgIUSRh2AaNP/nz08qY8OKxmS7aupDMwCgYIKoZIzj0EAwIw
bzELMAkGA1UEBhMCVVMxCzAJBgNVBAgMAldBMRAwDgYDVQQHDAdSZWRtb25kMQ8w
DQYDVQQKDAZUREZ1bmQxEjAQBgNVBAsMCUtleVNtaXRoMjEcMBoGA1UEAwwTa2V5
c21pdGgudHJveWRhaS5jYzAeFw0yMzA0MTYyMzM0MTNaFw0yMzA1MTYyMzM0MTNa
MG8xCzAJBgNVBAYTAlVTMQswCQYDVQQIDAJXQTEQMA4GA1UEBwwHUmVkbW9uZDEP
MA0GA1UECgwGVERGdW5kMRIwEAYDVQQLDAlLZXlTbWl0aDIxHDAaBgNVBAMME2tl
eXNtaXRoLnRyb3lkYWkuY2MwgZswEAYHKoZIzj0CAQYFK4EEACMDgYYABAHToBlh
LJXwzmyu3/+IjUm6bKCKKDVYrqjWI72ZW2H+JIRQkNPrUb/cTXWvIrnEr10IXFei
lw9fPkcM01go3ljvPAAmPM1O2BTY6uvwk3TXkcJKjH8kE6tEs1dYAtB08Hq7DNqk
CBcKdXHIvPysoXMQmru/lCnSkXUE7gohEBduULkzNKNTMFEwHQYDVR0OBBYEFKcp
aTb5Kuv8jv4n2gUTTcvGLX+hMB8GA1UdIwQYMBaAFKcpaTb5Kuv8jv4n2gUTTcvG
LX+hMA8GA1UdEwEB/wQFMAMBAf8wCgYIKoZIzj0EAwIDgYsAMIGHAkIBFYeYCn/p
DO33UFgpLEmNAVC4ZGThqdbX7LzdAsEzQjgPfQdTOFy+XI7xg3nrhdzErvTOsLFy
F8k+xF8LtgHnWGACQWx5iUTyU3zQBk4wr+nlnudEo6vVYxJR6t8u7IJV30pMxVtA
Hsl7HagSLRHnvoiuIxQMhzvwM+Cp1wEqoh1riXPs
-----END CERTIFICATE-----

Clean up ...
namespace "keysmith-example" deleted
pod "keysmith-example-pod" deleted
```

## Explaination

This example creates a Pod with an init container that runs a keysmith image once to generate a certificate and private key. Both are PEM files and are saved in the mounted directory shared between the main container and the init container.

The `run.sh` script clean up the Pod after printing the generated certificate to stdout. If you want to leave the Pod behind to examine the generated private key and node, you can remove the clean-up statement from the `run.sh` script.
