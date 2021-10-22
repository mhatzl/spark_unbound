import sys

fail_exit = 70
unexpected_exit = 85


with open(sys.argv[1], 'r') as fail_file:
	try:
		for l in fail_file.readlines():
			if int(l[0]) !=0:
				exit(fail_exit) 
	except:
		print("Tests failed!")
		exit(fail_exit)

with open(sys.argv[2], 'r') as unexpected_file:
	try:
		for l in unexpected_file.readlines():
			if int(l[0]) !=0:
				exit(unexpected_exit) 
	except:
		print("Unexpected errors during tests!")
		exit(unexpected_exit)
