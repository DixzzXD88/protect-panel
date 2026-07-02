<div align="center">
  
# 🛡️ 𝐏𝐀𝐍𝐄𝐋 𝐏𝐑𝐎𝐓𝐄𝐂𝐓 𝐁𝐘 𝐃𝐢𝐱𝐳𝐳𝐗𝐃

### 🔒 Complete Security Protection Suite for Pterodactyl Panel

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PHP](https://img.shields.io/badge/PHP-7.4%2B-blue.svg)](https://php.net)
[![Laravel](https://img.shields.io/badge/Laravel-8.x-red.svg)](https://laravel.com)

</div>

---

## 📋 𝐃𝐄𝐒𝐊𝐑𝐈𝐏𝐒𝐈

**Panel Protect by 𝐃𝐢𝐱𝐳𝐳𝐗𝐃** adalah kumpulan script keamanan untuk melindungi Pterodactyl Panel dari akses tidak sah dan tindakan berbahaya. Proteksi ini memastikan **hanya Admin ID 1** yang memiliki akses penuh ke fitur-fitur kritis.

---

## ✨ 𝐅𝐈𝐓𝐔𝐑 𝐏𝐑𝐎𝐓𝐄𝐊𝐒𝐈

| No | Script | Fungsi | Status |
|----|--------|--------|--------|
| 1️⃣ | `protect1.sh` | Anti Delete Server | ✅ Active |
| 2️⃣ | `protect2.sh` | Anti Kudeta User | ✅ Active |
| 3️⃣ | `protect3.sh` | Anti Akses Location | ✅ Active |
| 4️⃣ | `protect4.sh` | Anti Akses Nodes | ✅ Active |
| 5️⃣ | `protect5.sh` | Anti Akses Nest | ✅ Active |
| 6️⃣ | `protect6.sh` | Anti Akses Settings | ✅ Active |
| 7️⃣ | `protect7.sh` | Anti Intip Server (API) | ✅ Active |
| 8️⃣ | `protect8.sh` | Anti Modifikasi Server | ✅ Active |
| 9️⃣ | `protect9.sh` | Anti Tautan Server (View) | ✅ Active |
| 🔟 | `protect10.sh` | Anti Akses Node View | ✅ Active |
| 1️⃣1️⃣ | `protect11.sh` | Anti Bikin PTLA | ✅ Active |

---

## 🚀 𝐂𝐀𝐑𝐀 𝐈𝐍𝐒𝐓𝐀𝐋𝐋𝐀𝐒𝐈

### 📌 Persyaratan
- ✅ Pterodactyl Panel terinstall
- ✅ Root/SSH akses ke server
- ✅ User ID 1 sebagai super admin

### 🔧 Langkah-langkah

```bash
# 1. Clone repository atau upload semua file ke server
git clone https://github.com/username/panel-protect.git
cd panel-protect

# 2. Berikan izin execute
chmod +x installprotect.sh protect*.sh

# 3. Jalankan installer
./installprotect.sh
