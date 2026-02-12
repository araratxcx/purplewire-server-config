# PurpleWire Server Setup Project

### Project Description / Նախագծի նկարագրություն
This project automates the IT infrastructure setup for the PurpleWire startup. It handles user creation, group permissions, and marketing file organization.
Այս նախագիծը ավտոմատացնում է PurpleWire ստարտափի սերվերի կարգավորումները՝ օգտատերերի ստեղծումը, իրավունքների բաշխումը և ֆայլերի տեսակավորումը։

### How to use / Ինչպես օգտագործել
1. Run the setup script: `sudo bash setup_users.sh`
2. Run the sorting script: `bash sort_marketing.sh`

### Security Features / Անվտանգության կանոններ
- **HR group** has Full Access to contracts.
- **Finance group** has Read-Only access to contracts (via ACL).
- **Management folder** is restricted to department heads.
- **Auditor account** is available for peer review (Username: `auditor`, Password: `audit123`).
