def read_from_file_into_list(filename,list):
    print('Try to read from file')
    with open(filename, "r") as file:
        for line in file:
            cols =  line[:-1].split(';')
            list.append((cols[0],cols[1],cols[2]))
    print('File read successfully')

def print_list(list):
    print(f'{'Nr':<10} {'Name':<15} {'Address':<15}')
    for t in list:
        print(f'{t[0]:<10} {t[1]:<15} {t[2]:<15}')    

def main():
    list = []
    read_from_file_into_list("input.txt",list)
    print_list(list)

if __name__ == '__main__':
    main()