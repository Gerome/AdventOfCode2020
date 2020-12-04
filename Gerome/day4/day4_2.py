import re

required_values = ['byr','iyr','eyr','hgt','hcl','ecl','pid']


data =  open("input.txt","r").read()
c = 0
z = data.split('\n\n')
valid_passports = []
for z in data.split('\n\n'):
    x = z.replace('\n', ' ')
    y = x.split()
    fields = [i.split(':')[0] for i in y]
    if len(list(set(fields) & set(required_values)))==7:
        c+=1
        print(y)

        temp_dict = {value.split(':')[0]: value.split(':')[1] for value in y}

        valid_passports.append(temp_dict)

c=0
for pp in valid_passports:
    byr_valid = 1920 <= int(pp['byr']) <= 2002
    iyr_valid = 2010 <= int(pp['iyr']) <= 2020
    eyr_valid = 2020 <= int(pp['eyr']) <= 2030

    units = pp['hgt'][-2:]
    if units in ['cm', 'in']:
        value = int(pp['hgt'][:-2])
        if units == 'cm':
            hgt_valid = 150 <= value <= 193
        else:
            hgt_valid = 59 <= value <= 76
    else:
        hgt_valid = False

    hcl_valid = re.search(r"#[0-9a-f]{6}", pp['hcl']) != None
    ecl_valid = pp['ecl'] in ['amb','blu','brn','gry','grn','hzl','oth']
    pid_valid = re.search(r"^\d{9}$", pp['pid']) != None

    print(pp)
    all_valid = byr_valid and iyr_valid and eyr_valid and hgt_valid and hcl_valid and ecl_valid and pid_valid
    if all_valid:
        c+=1
print(c)