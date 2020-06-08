#!/usr/bin/python
import sys
from Crypto.Cipher import Blowfish
from struct import pack

bs = Blowfish.block_size
key = b'%s' %sys.argv[1]
ciphertext = "\x16\x88\x56\x85\x69\x05\x64\x86\x87\x6c\xc1\x65\x92\x88\xbc\xab\x5c\x8d\x72\xa2\xd3\xdd\x90\x5e\x1b\x13\xd2\x6d\x14\xfb\xba\x74\x43\x8c\x49\x70\x6e\x9d\x20\xf4\x69\xbc\x93\xfd\x37\x2e\xd2\x2a"
iv = ciphertext[:bs]
ciphertext = ciphertext[bs:]
cipher = Blowfish.new(key, Blowfish.MODE_CBC, iv)
msg = cipher.decrypt(ciphertext)

last_byte = msg[-1]
msg2 = msg[:- (last_byte if type(last_byte) is int else ord(last_byte))]
#print msg2[::1].encode('hex') ####Debug printing for checking Validity

decrypt = ""

for x in bytearray(msg2):
  decrypt += '\\x'
  msg2 = '%02x' % x
  decrypt += msg2
 
print decrypt

