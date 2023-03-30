import codecs

def add_credentials(host, username, password, filename):
    # Add information to file
    with codecs.open(filename, "a", encoding="utf-8") as file:
        # Write new values to file
        file.write(f"{host},{username},{password}\n")

def get_credentials(host, filename):
    # Open file for reading
    with codecs.open(filename, "r", encoding="utf-8") as file:
        # Read file line by line
        for line in file:
            # Split string into three parts
            parts = line.strip().split(",")
            # If host matches return credentials
            if parts[0] == host:
                return parts[1], parts[2]
    # If host credentials not found return None
    return None, None

# Example
filename = "credentials.txt"

add_credentials("host1", "user1", "password1", filename)
add_credentials("host2", "user2", "password2", filename)
add_credentials("host3", "user3", "password3", filename)

username, password = get_credentials("host1", filename)
print(f"Username: {username}, Password: {password}")

username, password = get_credentials("host2", filename)
print(f"Username: {username}, Password: {password}")

username, password = get_credentials("host3", filename)
print(f"Username: {username}, Password: {password}")
