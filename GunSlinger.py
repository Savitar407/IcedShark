import os
import sys
import pyfiglet
import time
import datetime
from apscheduler.schedulers.blocking import BlockingScheduler
from textmagic.rest import TextmagicRestClient

time = ""
scheduledTargetNumber = ""
scheduledMessage = ""
scheduledPhishingLink = ""


def showAscii():
	art = pyfiglet.figlet_format("Project Gunslinger")
	print(art)
	print("")
	print("DO NOT USE FOR ILLEGAL PURPOSES")

def sendSms():
	username = input("[+] Enter Account Username: ") # change this
	token = input("[+] Enter Auth Token: ") # change this
	client = TextmagicRestClient(username, token)


	targetNumber = input("[+] Enter Target Phone Number(add +1 to number): ")
	print("")
	message = input("[+] Enter Phishing Message: ")

	phishingLink = input("[+] Input Phishing Link: ")
	try:
		message = client.messages.create(phones = targetNumber, text = message + " " + phishingLink)
		print("")
		print("----------------------------------------MESSAGE SEND-----------------------------------------")
		print("[+] " + targetNumber)
		print("[+] " + message)
		print("[+] " + phishingLink)
	except:
		print("")
		print("[+] ERROR OCCURRED Sending SMS Message To: " + targetNumber + " YOU MAY BE OUT OF CREDIT")

showAscii()
sendSms()
