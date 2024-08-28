#!/bin/bash

# Update and upgrade packages
apt-get update
apt-get upgrade -y

# Install required packages
apt-get install curl socat git -y

# Install Docker
curl -fsSL https://get.docker.com | sh

# Clone the repository
git clone https://github.com/Gozargah/Marzban-node

# Create necessary directories
mkdir -p /var/lib/marzban-node

# Change to the repository directory
cd Marzban-node

# Create docker-compose.yml
cat <<EOF > docker-compose.yml
services:
  marzban-node-1:
    image: gozargah/marzban-node:latest
    restart: always
    environment:
      - SSL_CLIENT_CERT_FILE=/var/lib/marzban-node/ssl_client_cert_1.pem
    volumes:
      - /var/lib/marzban-node:/var/lib/marzban-node
      - /var/lib/marzban:/var/lib/marzban
    ports:
      - "2000:62050"
      - "2001:62051"
      - "8032:8032"
      - "8443:8443"
      - "2030:2030"

  marzban-node-2:
    image: gozargah/marzban-node:latest
    restart: always
    environment:
      - SSL_CLIENT_CERT_FILE=/var/lib/marzban-node/ssl_client_cert_2.pem
    volumes:
      - /var/lib/marzban-node:/var/lib/marzban-node
      - /var/lib/marzban:/var/lib/marzban
    ports:
      - "3000:62050"
      - "3001:62051"
      - "2065:2065"
      - "2150:2150"
      - "6985:6985"
      - "6358:6358"

  marzban-node-3:
    image: gozargah/marzban-node:latest
    restart: always
    environment:
      - SSL_CLIENT_CERT_FILE=/var/lib/marzban-node/ssl_client_cert_3.pem
    volumes:
      - /var/lib/marzban-node:/var/lib/marzban-node
      - /var/lib/marzban:/var/lib/marzban
    ports:
      - "4000:62050"
      - "4001:62051"
      - "2067:2067"
      - "9785:9785"
      - "2087:2087"

  marzban-node-4:
    image: gozargah/marzban-node:latest
    restart: always
    environment:
      - SSL_CLIENT_CERT_FILE=/var/lib/marzban-node/ssl_client_cert_4.pem
    volumes:
      - /var/lib/marzban-node:/var/lib/marzban-node
      - /var/lib/marzban:/var/lib/marzban
    ports:
      - "5000:62050"
      - "5001:62051"
      - "2096:2096"
      - "22850:22850"
      - "1515:1515"
      - "1616:1616"

  marzban-node-5:
    image: gozargah/marzban-node:latest
    restart: always
    environment:
      - SSL_CLIENT_CERT_FILE=/var/lib/marzban-node/ssl_client_cert_5.pem
    volumes:
      - /var/lib/marzban-node:/var/lib/marzban-node
      - /var/lib/marzban:/var/lib/marzban
    ports:
      - "7000:62050"
      - "7001:62051"
      - "4330:4330"
      - "6124:6124"
      - "8891:8891"
EOF

# Create SSL client certificates
echo "-----BEGIN CERTIFICATE-----
MIIEnDCCAoQCAQAwDQYJKoZIhvcNAQENBQAwEzERMA8GA1UEAwwIR296YXJnYWgw
IBcNMjQwMTMxMDkwOTE3WhgPMjEyNDAxMDcwOTA5MTdaMBMxETAPBgNVBAMMCEdv
emFyZ2FoMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA0SHo/G8j5Jtb
qGd023bL27xpEo59+MZeOfx+xr0BZvyhjb9G6DNvTCU1NgcxYLYjQ8cj74oMHngB
5wYgKdISnjF0mqg7Ebq04sukNH2R8aOw11DpmIWaw43kU1BUjloCie+rAQuQgPN9
hwdK0+tEnDfnVrJnbFuUFe5H3IshHMdjXOZk6ue37jXBtpG8wqvhGU5kT6HRcYYK
omk4Hf74Bk8iF7H4atg+lZJ9AjaFjmnadDla+H22sytS54id//2IFv70aAYZAV40
ZOYCD1hPfYQ45ircYpcYgwyGtN4ofZDSdUA/7RJH3Vu55wLfvhmP+00a77LoubME
Giro2Junyl0V0jrihxdRovMfDuVpeEtyECLy5Kp5EaXZQ1IgJRDAgzruqnLatdMQ
ZCH/9jM7yrvadfKoLCKmqFW96OuuZLzpIChXiBlXPwQ92lTaO4pBXLzbdLWpppxS
ftbIT37h+dyVAO5P1XzglmmzzFJwHwhMwCHzpJNet6ov5NSmrMUiISQvfJiOIA4q
LIeJudrH4d3Y7KYSnSMh/wMgrI3TIcOxnp6OKnzjNdnpfI5d1/nST2+b5O0pfRwp
jRaccCVwbkk9nVXOzWrqkhpVc82fBmgbXSFBs3D8ut/DZHKxZi4OBKSUyhSbJwzH
omHPxb7cIdUfeaM/fUF67oisxQZzRmcCAwEAATANBgkqhkiG9w0BAQ0FAAOCAgEA
e/KAEEiRGqiciiKt+WkSWyylRnHjbijzUfqHlNjCa6eCGgtBQWP3EOZ5NhKnLC/l
1g5gp+/ttEGNCnCbJDaytbBXiElvSn0wL7NOof0Pz6hrcFL3PtGn9YV9lLi8olnr
dzvSJN9TM90qjVSirQ4QljLtjOCMwPWA51rgSLsyRTII+Ein3iOJpyZQlrlyXSJw
yjtoQqZgaSOMDEL8YgZnOcTBOlea38qwiX7nzV64QmQVCN2XmeUJsQ3tb1E/KaKY
1piNMu9ojBzn0++UQTmikGawcJ9qJuzDBxCF0x7EQvdF3Raar+KueLeC3m5+6z2b
VbJ6MSO/24YgfxT5E4bOOtqpRgoZQIDNvzlxMC5LeWJ5i6vh+B/alMNHtnXlLoot
qvOpiz03Cdb8/PfDsWEPx3f+ahkImD3/2eRQqdH+Nul1OLE4Iq0xtL0CttjSXdWk
Puh4JzCWYi0qVXyvW4hvYiJhmaDU+eTbPxtnF/6g/ViKMp+yo54fmqrDd8qEv33F
WFxYwviZbwaCnJB9bOX6tPn9fiJ8PE1O2maTkfdElQ7x9T2+xmBTjuzkKUKm7oQM
E3CoBtL8BjbzRe3ECW2iVeqorEdg5VqCyw4RC4KXE7Bb6QN6vpx8Ds3XBAH8EL3d
wU69MYPzvuntP35H+9jxYpig+pF/kJMvfNnLNrlIfpE=
-----END CERTIFICATE-----" > /var/lib/marzban-node/ssl_client_cert_1.pem
echo "-----BEGIN CERTIFICATE-----
MIIEnDCCAoQCAQAwDQYJKoZIhvcNAQENBQAwEzERMA8GA1UEAwwIR296YXJnYWgw
IBcNMjQwMTMxMTc1ODMwWhgPMjEyNDAxMDcxNzU4MzBaMBMxETAPBgNVBAMMCEdv
emFyZ2FoMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAr7p+DhrSPO1I
hdVjeXVRgSmYVUJG29ft/4cdQv/tlcIZn66c4aJRkZnzGznYn1Fy9oVf3iYoRLLc
uq2BRdUAwxtg8CSzjiJFSMhy0TSCziDvOMO5yYHLn5dpiu/00LfisWtG1T8nVD3W
PvdqnfsrI0qX1GNSzFmjvOa2Srizp6jSKG1W9QR9l9UzIJWZQSwnW6oW/jyXG+aP
EEmkXo1V/JLkIt6AqIY4SmhevyK2JJTlh2GkY5UnJQSwBHNb7rT+LPeKpUMtmGwb
1YFMh1H22HfmoGWcMTmLVst0UEV+y1EEx5+GoSLwKJxf6RChPXlva0jTqlO8pYMS
4DkluwbDGEkLWKF8633it1grTbgwKBdmasxTyUjn94CZ0/6JGY14lSpn8yoZymTM
4IhDh3MABgg7eyjJcO6Vyg/+DSQbUOXf7c4PQLVlWp1ja9kSUd6by1npHBjxVDcS
1iV6iPRu+f6b/HHF297eaRhH3eZycBA9oYeRX83kxZUh1rR97yUefoUl1DM8UAry
h7G5yhWJtSHHrp2zruQT7BNLMqY40MD5NLK8UTLM2t02e+5oNK6dyrllSkaQJnyv
smgh9UL4tgyu0Az5OXmcBfmrspBRWhP4EEraDC+7mLUGt/iMPfViS53cSNyWs1mZ
3jq14gmlXnRnrDoy7QJlQW+z4eqGrb0CAwEAATANBgkqhkiG9w0BAQ0FAAOCAgEA
KzsvrxZOUtquv5a4YZH98NpDZSbgyAeH9TRhGT6NjtuQO1UIOIvYrIk2FYiocnTb
glgQZsokqxyscAZjFtSEGS80AAr7f7cLbNTrRBLn8Nodi61Efhn95oY3yvJAi1+S
j9IsHVAv6QdLm4N9GA/uWT+3KEH45pZ/VZ+5NyQ/4ZSZy3sieEBIrsMkW4IFmT71
e3N+EIRR2pjet9FrqD+q1fN9t/BXUH+yANIXNMwbcfxDw4Dqc0Qa9MU4q8rGgam2
f7SsmnXYjc1DYS9PPNqGXoYIdQ4qMFhJnxm12KwAM8KNOW71/AsYAMR3RrH4E8lR
nmYmrUeEprUw2uXE/8oAjULz68fopfRycqpbdR235cjMZ3xAZC6dGybu61SBurJN
kvETEVyEsttmJM1HBzcluUC2InOu7CXQbPJhje8VlROjC3CH1dqZhE+ad50RBkNh
Xy07GkGD/70jyKF6Z7ELtAQEMgaf4Otu7Zhg9lAyj/pNCbxei3T5A7zhPyvUvI+4
eKyiLST1cGmyt14NdydFnaA7iQ4wma3DSOMdec7HZCP+jmsF5d+9XClis9ybf4XW
kmBAZKgKzqOC09PoKMTXaC3jTI2CH7l7HD1H+uJ5C49DFxklH557Wer5rzpMjBz7
pLIDAekDshUGki+nXA868upK/nxRGO5iI6GiuDx4Mys=
-----END CERTIFICATE-----" > /var/lib/marzban-node/ssl_client_cert_2.pem
echo "-----BEGIN CERTIFICATE-----
MIIEnDCCAoQCAQAwDQYJKoZIhvcNAQENBQAwEzERMA8GA1UEAwwIR296YXJnYWgw
IBcNMjQwNjA5MTMzNjUyWhgPMjEyNDA1MTYxMzM2NTJaMBMxETAPBgNVBAMMCEdv
emFyZ2FoMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEArkdcyK281Env
AHpAhvRdMcNqSLQfWVwEjLcAnHLNzG6rdQBLG1ez6kSUBpX0xX8LEKLhUq6Pn5LW
nztwzs1YEpIFy6LbXHDcgH1dMSy0cHYsLMHCyePoCPI9rAK8xEx8sKCDMMV6ondd
lOkCFZsAqvcFspiTxlxpv0U2Kiw0XT27Nn8qlJFqPiOVHSKfdPvKW8BdMVnGYHX8
otsCjywyvZwwU42wIOdeXGyyIDEqvxbN2u5we153suXK0SfjdUUyF9ZTqSeiOOd5
4KDN7xd9VI9jOpPnPrZHXXPiSM2Vo37ma1XSjCCOiBEDe3AQkRZ7hGKivBDYIC1R
OZvrd9rq4mVUFjO07/SU68TObOcbF0CiGZn/Trf+G+uez7HUL6bchHfvTt4e2/wM
RXjGXOFHulftaXnrfivzd+l4RuBjiWgMLgn/fSOevhdzTq+1SH/teW2DDhnRN6tT
1vNyHOg5opv34Pw3vMBC/mrpeNgQMziGPRGN9hM8vET9rsuU7F6bUMe/TtD5+YS7
fS91SDXM/n5AOn/DK85t65CX/IR5ekN4zci8hFpXy6cpU3cfRsOzuZsLRRVNmuh+
PL4WjyMPMHdI936QN1oVbkR+tlEiiMd+TqcZRS4ZSSHgu0wPx3wSFLgbqzs0vnfG
QkMd3vMkm7otoGFVrwTwihGGFJF5AccCAwEAATANBgkqhkiG9w0BAQ0FAAOCAgEA
adIQAMFVeyRELn12UeW3IUgmMhqs4RaIc1Te+FuwB7RsrgdGiSryKjkCftcpZsa6
L4PjqcbeeohC7c2z01PIRUrRAYQzUJ7K/GsERSqyVafzzh3hiWt4u8L85TWLMZqh
eCUo3JCSEXeiEkIhs8CChIyfO7MIYCPOiHnjV22uirYhT5lSswk+SPr3ly0FIMvO
c6SBMuF8jtU554yL+jvFKD44uogD5Nhlvtx1pADGUlssiey5M4hgIgsu8psIIZO7
ldSLvY7sj9yibH106U96z1kYJx4TMPfQWF1WHzfA53hu1lYBfj9InfahpYiLejg5
7KrStY+7DwhJh0th/oAfu1w3IEzIxbV0AGB+ZZ7uH36/HOpoUMoUQ0HjcXWk1Uxc
Rbs4ZOOfCrPpb+96SN0K0YrdxrbKcKmC0N3YEF13zcdLb9K4muKvAV+AuMF9n7Ma
3N53CxPx9Ceyys56aiqN+Trz5fdeozt2OuEaqq7xufDUae17etWWWFaFfNTXkrCR
mhKChJ8s1Y/k1IFR572kBRrysL+E3X6rZbeVtvMFUJveab/LrIWHToxF95zxXux8
fkfELtXz9H/KfdD5NZnqcOhRhSMokOWw2offy9p6mppZ9iR5uM9DfdiShaJZP2ld
Ocd2Cte2Q7WkQIShGvJVy0vO78IyM4fR6Hiu6X0jeDM=
-----END CERTIFICATE-----" > /var/lib/marzban-node/ssl_client_cert_3.pem
echo "-----BEGIN CERTIFICATE-----
MIIEnDCCAoQCAQAwDQYJKoZIhvcNAQENBQAwEzERMA8GA1UEAwwIR296YXJnYWgw
IBcNMjQwNzA5MTIyMzM1WhgPMjEyNDA2MTUxMjIzMzVaMBMxETAPBgNVBAMMCEdv
emFyZ2FoMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAlFEJAU8Ueua+
8A64X7KoRjqADvv6g2CnDlmkkwWkPe9rCxavxfa1vM8tRUFbJLXJkuJdSgDUZ3ue
zmAw0FOB3gyCZ1/ngkxF0UX5pzLeDSsmJ/Afz9FmFXrZH3tGQNtJ8ZOcUy+LQINl
7Z9dq0rojC4M5pt0Q47cLvboQffvkcnmUXKkfYtUSGAjvDEPdpy2SX2S8gXzM/RE
u3jqueLy7P8ss/V/+ETn5vK/owtbZFLp7GPB02hpkT68odta2FPuZ/3Rd4cqvwZ0
ka5BcP+y5e/HtCsugWLD+HDuU/clKFbFXjg+ySjW4T45bheoRgkn/BJs/PkwE33w
95mVes2UyGXLEBfh9n0W8PY1KN/hzeoU5sZ5tHN3BQg3fPo7G/EnrklUx0eEJqyH
wr/kHo2/xXglffIaqUA4egxOyEXweeWnSBzFhTEp1dja9eDfKw7c2POQIcdUdTU4
0pLlPrcN3ZurodWv3rMkpo04PFa5SO4tGy9vWPIZuDBRE2zHR73IyLZya69wIjBa
ErPo9g7HyrUXuwbWkVs2xqx0QPuyxE0/atio6Rp1e++CWPHU2dgNqFwDvpru86aB
3gefzevS8X0sCHB3hh1IeV50f9XRgvhoLpijDJGxhlZnzU2e1w8q16I2vymAIzYs
Wnz7z5JlXiW1G69hRjJ8AwbXz5WDMc8CAwEAATANBgkqhkiG9w0BAQ0FAAOCAgEA
b1kD9VaLNOVO7ZKKVLfoVzBe6bUcJxRHicYwgCtNqBRQ23d5m6oNejj8QlKw/p9S
PosU6vSZDbwaepk/26QD5J4eJMSl9cGbhtwFiXVlXwS6JHBBZiTlol3lzH4hUwCz
Llac+8ZkjbrlIyd3XwfvTtaC2ny8xbNl2LIz2urJvDcQrLRfiQ/fdCEKoCBeIU9p
7IsAE8RAtfQacoGIv6A4+GrAeVIZJWkaynYcACtuyrrW949TJS/AGgg8OWkdoUSF
aXr9x0+EPMlDGoWLWPgrgroVhp6otSbJkYTBEOdV8fpexnQVa/+9HXz1hjNVes3s
gaOxp+YpnLRhgaqX0/7VhfXh15tlxVzyON4qHWoiyuG4qJnw1gcccto+BEFU4Lxr
Np439Wcj6O4WsH+HUQDmxmLPh8Lo6l10oU71+6bngIds41gqKoPpUg/X6PwAIIWx
3KNaSuiwTP5cFT9vBH37vXZvKS0b6EiGrMvyeMpVgrTJo1gw3cm091/n++fGTY5d
lu5cSSxYwaTb8zoxmLD+dyNR1Xlp+9fS9QEU2Vlwr4SxtpkizycdOPGjYAAiDLZT
FaI7gwuL/SiJuUdKrktzE4zPYIL8op6X9crmzdpMBbowXlTzNzmLZWe8IjN3DQmr
HdxfFC9CFr/GS5FpCE1S84YIpJlxb1WfJV9jeKu/Mts=
-----END CERTIFICATE-----" > /var/lib/marzban-node/ssl_client_cert_4.pem
echo "-----BEGIN CERTIFICATE-----
MIIEnDCCAoQCAQAwDQYJKoZIhvcNAQENBQAwEzERMA8GA1UEAwwIR296YXJnYWgw
IBcNMjQwODI3MTA1OTEzWhgPMjEyNDA4MDMxMDU5MTNaMBMxETAPBgNVBAMMCEdv
emFyZ2FoMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAhJfGZxsWQU8E
9y1XIVswAHp3IWQ8kWeGiFlEsm6bwAcw1sIFCEXSyqeNNsAzKsdCE0qgaKpYT97y
fF/Dq3tg06Nrk61eZESQ4tb9xcq12oBWnRDZd2tBWrDCORBeFis839HTVrsfA1br
uH3pRYuqAJ7ffdS5q+T3kbLYvXqIWdQuNX/rasUTRAB68Eh7p3dEX7JVFnIuHrNL
VKT1lP9bP8DSZ1MgOci4qvFfMOgBJGHDxLJrDTZvh1nWzOObytru1dSxUH3eGlBh
pHF5sFNJwKGPf0TNF+2EeWV4GJ7d/Oy3fsESi/cH/aTWD+oVFK4E80RS5Coep9TM
Zzgqf7f0bbIQXYUDZkIWe6ymDi4bHqBkmtvJwSrAZqNve3WtvxwR6wLKbhpdYIdH
7JSsl0ogWqMLACMphaHZgAq7xDq1js94p8n4UkdnVqJF6Pc3LRfBLM47txj6nmEG
iK+hONeqViu4rqOMxD6JHpHocBXa7+0YyVRaujKuIEsYpSwijOqs0fiageqjtWEr
yvn5oyTtIWhaCUrhXpaDKfl05OBM0vk3I1WVEwe9FS0n2TAlNlDbv57prUuXXsE3
NVjcF0ahtJRR9B8VdWfSZSVv1Bb/YGa2yWPb9cyrrykB40cMRjjR9zcAb+MEBQuP
YKv0nQ19UkUR8kAc5lfq9b0DjNnhw7MCAwEAATANBgkqhkiG9w0BAQ0FAAOCAgEA
Ux/M69L/Qx61f/H6uQlivGWgqMLmwt1jB41iXkYMtWmU0JKB/j2vXpFayT2PlBw3
c8YmPnAmYJvJFKG9rZPQKp0WEi6XnZKTuL01znJWpnMv40Fsqp9+amVP317Lvuyg
MvEsM070+G/RG2bNzQM0V/85+pXBu1ltl+2u+Dp66kWrTPUTKYT8IInbaD/IuQbN
v6UKwPd8g1AD6VxUG9Zp7d49N5kbSVCUVWsImzHP1hRLxbTuKy+bEng54ZEcd8f9
Yi3frVM1xA8dCNhk9gYgqRUQ4UzY+IypgEL2TPLCGP99KDeG1vf8vH15KyL31Vqm
+O/bbfpF0ipCM2/4Cye6rJt0F7VgrMwEr8rpH5TUMV9NtceUlz/Za9dYGgBMs3o0
/+PusRui3YUmV7r57TP2aDxP5wk7/CSeqD1Gjq19IO7bpSBs7UwNa3lsgp424Sxi
q5Mg9kftc2vrc+O2Y1BLtOsnOov7QfuiV04UvA0LGYwW830BrAhxSFGSycpqDEfD
yBcwCfFqY0p3LdOeL/gxVZDtvzlh9T/tduzoB+NaygVgcNf58we5hlbW919PEI3C
T0mgP40C85kF+XZshd8Fn37w49m3KBa6CFXRDpGHDd0CXuSleICDttqDDwvkzt6L
BKKw1Vzd7/vnpNtEUuuVZAVtXbthQeGqhS/Q/+aOKzU=
-----END CERTIFICATE-----" > /var/lib/marzban-node/ssl_client_cert_5.pem

# Start Docker Compose
docker compose up -d
