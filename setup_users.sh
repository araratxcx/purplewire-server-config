#!/bin/bash

# --- STEP 1: Creating Groups / Քայլ 1: Խմբերի ստեղծում ---
echo "Creating departmental groups..."
groupadd finance
groupadd hr
groupadd sales
groupadd management

# --- STEP 2: Creating Users / Քայլ 2: Օգտատերերի ստեղծում ---
# -m: create home directory / ստեղծել տնային թղթապանակը
# -G: add to secondary groups / ավելացնել լրացուցիչ խմբերում

echo "Creating user accounts..."
useradd -m -G finance ruzan
useradd -m -G finance,sales,management hovhannes
useradd -m -G hr,management tatevik
useradd -m -G hr yelena
useradd -m -G sales narine

# CEO with sudo privileges / Գլխավոր տնօրեն՝ sudo իրավունքով
useradd -m -G sudo ani

# CTO Vard with specific password / CTO Վարդը՝ հատուկ գաղտնաբառով
useradd -m -G sudo vard
echo "vard:TimeIsTheMostPreciousCommodity" | chpasswd

# Auditor for peer review / Աուդիտոր՝ ստուգումների համար
useradd -m auditor
echo "auditor:audit123" | chpasswd

# --- STEP 3: Folders and Permissions / Քայլ 3: Թղթապանակներ և իրավունքներ ---
echo "Setting up directories..."
mkdir -p /data/employee_contracts
mkdir -p /data/management
mkdir -p /data/marketing

# Employee Contracts: HR (Full Access), Finance (Read-Only)
# chown :group sets the group owner / chown-ով խումբը դնում ենք hr
chown :hr /data/employee_contracts
# 770: Owner & Group can do everything / 770: Տերը և խումբը կարող են ամեն ինչ
chmod 770 /data/employee_contracts
# Give finance read access via ACL / Finance-ին տալիս ենք կարդալու իրավունք ACL-ով
setfacl -m g:finance:rx /data/employee_contracts

# Management: Only for heads (management group) / Միայն ղեկավարների համար
chown :management /data/management
chmod 770 /data/management

# Marketing: Access for everyone / Հասանելիություն բոլորի համար
chmod 777 /data/marketing

echo "Server setup finished successfully!"
