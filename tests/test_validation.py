import sys

exit_code = 0

with open(sys.argv[1], 'r') as results:
	for line in results.readlines():
		line = line.strip()
		if line.startswith("Failed Assertions:") and not line.endswith("0"):
		  print("Tests failed!")
		  exit_code = 70
	  
		elif line.startswith("Unexpected Errors:") and not line.endswith("0"):
			print("Unexpected errors during tests!")
			exit_code = 85

exit(exit_code)
