#!/bin/bash
apt-get update -y
apt-get upgrade -y
apt-get install apache2 -y && service apache2 start
cd /var/www/html
echo "<html><h1>It's properly working !!!!! </h1></html>" >> index.html
echo "template is working and public ip is $Variables" >> testing.html
cd ~
echo "-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAqp606T58YWc/YSJRWnCWDzs0DqFtS3hxJs+fOCa7nxCK81md
qUo0qKAL4Ao9T1JkxZsAzZ3dUlMvPbBEaBLE9g2UPMJ8sL9t97Am22I3exbM0Slu
5K/OQ40wskDyO11iHYaRH5+4wIkSjOTmGl+5AaaDT+Esqt9UZiP1nrUyNklSefR7
08JTbL41scbrPLfIdblz71FPe0mQx6It0S79NKrXFa1GvKFQ+CZclHol2ND9MxRG
Qb3MIrizKRSiCAq2/HcoS4N9PIDpbVFI63mQi3dWV/nckAD/PT7LRLJ9VUrTt7YH
KXdh47LY6b9o+IKPPGyo/EyIIL3h7Apm0Tc5/QIDAQABAoIBAAP9tGOkV4p7vMrL
37VK3ue6Tcxt0D2sspDi2Gma1laxL17j4ME+AB9VpxF1i9uYJM1Og+VLZQrw8TDz
N5ZrofnTdX06W2pTAAKEN1R4Zq3VabMW0gY9aoi/+7yfskrbM1lXdXuU4+B1FF8B
V7SUOqKkP3wV21Kf6Lx+6NbujB8i7CjkauWk51YULMsmVsWV97O8HSXfsGIfCeo4
gQcjiAHMsxzSJPfrpkhvxEuOf3b1MT8KO9Mv29J60XRN4CDI4n1IZy9287K1G3SL
uDC0DPEDHWm4BNJqi7QDBcjiJPT3KvAdSu3FvmGewntGsFXVZA4/ON38HGjeEMyR
Blo3bI0CgYEA0jJsfHzANOvrI9EuQjuxuVEfuKuTSW/v5pyaiqSAT1diSjpkMfeD
UoAoAfj4W7W7CqPOe50fwGhbZqvFyp9ouOI103tTZjPJsF4fhOos1aPeeBaDWZmL
2xNH8EwPQvRH8lhKEuCJGa+hz4J8KZOjA+9BbZU2ZLjq7yhyI0Uz6SMCgYEAz8yH
MpirdAGoV0rIGWcZjJqx9wzUMNOBEakKGcyRbloTdg8CpTU7r0y774LTnM5PhqS8
C4hyywuVQJzQhc5US48rCwZFRVkSX7FQtBH1c8FYrATFviwq+f0WyPOjwXUyUov4
Y1MBSyYD/or4f+7a4wh9ChrxAAG2R/3nmVdH0l8CgYBlOCDjxZMtKNo/kjCrdmF7
8uPKoty3RW8J5ynIT7T2AAd15S5wnVcguFQLtx+p0hZy5jS9dAlhNx+kjl0d2Kuu
NEhlQYMEuTWLd5fIAph6fIHZ5EV2NSmS4nMG9Sl4PXgT7I4nDvcWZmwOKDCwOMcM
Uv93zJ233RBNAHYOI/n+bwKBgHO3EoaDa96y2Zqaoyk6N4kL0BSiCTuTXCmId358
Y3QPJw00OKXlKfJpibJLqSmF3dU9wRWvCzW0oo2Tha8tgdV9yVtfR43hlxDAvg84
fPXT8lwAYFmRYPFLFbgbrNIbQEWlelFdNLgzWEAUBWPAkBWjcXYCILh/O5GFe8Xx
S6aDAoGBALBWfBQYCZvUGITrKm6eIVO23QmlhEYg1SQzxEVmZgen+Q0KWXS2C8c8
lab14ZDuSBvjoWzwPWxKcep8MFroywOvOqPklT0rgcQprxK3CKQ1p7/DCSaS/f9n
SjGBZtfQkGF/fSq22tY234RADevPnx4lXFO8JOwhF4eshYxl3dAv
-----END RSA PRIVATE KEY-----" >> ~/mykey
chmod 400 ~/mykey