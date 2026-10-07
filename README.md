# 📡 MikroTik Netwatch Telegram Script Generator

<p align="center">
  <img src="https://img.shields.io/badge/MikroTik-RouterOS%20v7-00599C?style=for-the-badge&logo=mikrotik&logoColor=white" alt="MikroTik" />
  <img src="https://img.shields.io/badge/Telegram-Bot%20API-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white" alt="Telegram" />
  <img src="https://img.shields.io/badge/Language-HTML5%20%2F%20JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black" alt="JS" />
  <br/>
  <a href="https://hits.sh/github.com/sohag1192/MikroTik-Netwatch-script/">
    <img src="https://hits.sh/github.com/sohag1192/MikroTik-Netwatch-script.svg?view=today-total&style=flat-square&label=Total+Hits&color=2563eb" alt="Total Hits" />
  </a>
  <img src="https://komarev.com/ghpvc/?username=sohag1192&label=Profile+Views&color=2563eb&style=flat-square" alt="Visitors Count" />
  <img src="https://img.shields.io/github/stars/sohag1192/MikroTik-Netwatch-script?style=flat-square&color=yellow" alt="Stars" />
  <img src="https://img.shields.io/github/forks/sohag1192/MikroTik-Netwatch-script?style=flat-square&color=blue" alt="Forks" />
  <img src="https://img.shields.io/github/license/sohag1192/MikroTik-Netwatch-script?style=flat-square" alt="License" />
</p>

---

> 🌐 **Language / ভাষা:** [English](#-overview) | [বাংলা](#-পরিচিতি)

---

## 🌟 Overview

**MikroTik Netwatch Telegram Script Generator** is a web-based tool for network engineers, ISPs, and system administrators. It generates ready-to-run MikroTik RouterOS v7 Netwatch scripts that send instant **Telegram notifications** when a monitored host goes **UP** ✅ or **DOWN** ❌.

### ✨ Key Features
- 🇧🇩 **Full Bengali (বাংলা) & UTF-8 Support** — Solves MikroTik `/tool fetch` URL encoding issues for Unicode text.
- ⚡ **One-Click Script Generation** — Fill in the form and get a complete RouterOS script instantly.
- 📋 **One-Click Copy** — Copy the generated script directly to your clipboard.
- 🕒 **Dynamic Time & Date** — Automatically uses `$CurTime` and `$CurDate` from the router clock.
- 📏 **Optional Link Distance** — Optionally include fiber/cable distance in meters in the alert.
- 🔒 **No SSL Setup Needed** — Uses `check-certificate=no` so no certificate installation is required.

---

## 🚀 Live Demo

🔗 **[https://sohag1192.github.io/MikroTik-Netwatch-script/](https://sohag1192.github.io/MikroTik-Netwatch-script/)**

---

## 🤖 Telegram Bot Setup (Step-by-Step)

### Step 1 — Create a Bot & Get Token
1. Open Telegram and search **[@BotFather](https://t.me/BotFather)**.
2. Send `/newbot` and follow the prompts.
3. Copy the **HTTP API Token** (e.g. `719600063280:AAFhAgYxnKcOl7_yW7a0IfYBifwqZDdTkQRI`).
> ⚠️ Keep your token private!

### Step 2 — Get Your Chat ID

**Personal Chat:**
1. Message **[@userinfobot](https://t.me/userinfobot)** — it replies with your numeric ID.
2. Send `/start` to your bot so it can message you.

**Group / Channel (Recommended for teams):**
1. Create a group/channel (e.g. `NOC Alerts`) and add your bot as **Admin**.
2. Send a test message in the group.
3. Visit in browser:
   ```
   https://api.telegram.org/bot<YOUR_BOT_TOKEN>/getUpdates
   ```
4. Find `"chat":{"id": -100xxxxxxxxxx}`.
> 💡 Group/Channel IDs start with `-` (e.g. `-1002700089369`). Copy the full number including the minus sign.

### Step 3 — Test Your Bot
```
https://api.telegram.org/bot<YOUR_BOT_TOKEN>/sendMessage?chat_id=<YOUR_CHAT_ID>&text=Test
```
If you receive "Test" in Telegram, your setup is complete! 🎉

---

## 🛠️ How to Use the Generator

| # | Field | Example |
|---|-------|---------|
| 1 | **Host IP Address** | `192.168.13.46` |
| 2 | **Comment / English Name** | `DHAKA TO GAZIPUR LINK` |
| 3 | **Bengali Location Name** | `ঢাকা টু গাজীপুর অফিস` |
| 4 | **Link Total Meter** *(Optional)* | `1500` |
| 5 | **Bot Token** | `719600063280:AAFh...` |
| 6 | **Chat ID** | `-1002700089369` |

Then click **⚡ Generate Script** → **📋 Copy Code**.

---

## 💻 Apply Script in MikroTik RouterOS

### Method 1 — Winbox Terminal *(Fastest)*
1. Open **Winbox** → connect to your router.
2. Open **New Terminal**.
3. Paste the generated script → press `Enter`.

### Method 2 — Winbox GUI
1. Go to **Tools → Netwatch → + (Add)**.
2. Fill in:
   - **Host:** Target IP
   - **Type:** `icmp`
   - **Interval:** `00:01:00`
   - **Timeout:** `1s`
   - **Comment:** Your link name
3. Paste the `up-script` block into the **Up** tab.
4. Paste the `down-script` block into the **Down** tab.
5. Click **Apply → OK**.

---

## 📄 Example Generated Script

```routeros
/tool netwatch
add host=192.168.13.46 type=icmp startup-delay=1m interval=1m timeout=1s comment="DHAKA TO GAZIPUR LINK" up-script={
:local CurDate [/system clock get date]
:local CurTime [/system clock get time]
:local NetHost $host
:local CHID "-1002700089369209"
:local BotID "719600063280:AAFhAgYxnKcOl7_yW7a0IfYBifwqZDdTkQRI"
:local HostStatus "%E2%9C%85%20%E0%A6%B2%E0%A6%BF%E0%A6%82%E0%A6%95%20%E0%A6%86%E0%A6%AA%0A%0A%E0%A6%A2%E0%A6%BE%E0%A6%95%E0%A6%BE%20%E0%A6%9F%E0%A7%81%20%E0%A6%97%E0%A6%BE%E0%A6%9C%E0%A7%80%E0%A6%AA%E0%A7%81%E0%A6%B0%20%E0%A6%85%E0%A6%AB%E0%A6%BF%E0%A6%B8"
:local Message "%E0%A6%B9%E0%A7%8B%E0%A6%B8%E0%A7%8D%E0%A6%9F:%20$NetHost%0A%E0%A6%85%E0%A6%AC%E0%A6%B8%E0%A7%8D%E0%A6%A5%E0%A6%BE:%20$HostStatus%0A%0A%E0%A6%B8%E0%A6%AE%E0%A6%AF%E0%A6%BC:%20$CurTime%20$CurDate"
/tool fetch url="https://api.telegram.org/bot$BotID/sendMessage?chat_id=$CHID&text=$Message" keep-result=no check-certificate=no
} down-script={
:local CurDate [/system clock get date]
:local CurTime [/system clock get time]
:local NetHost $host
:local CHID "-1002700089369209"
:local BotID "719600063280:AAFhAgYxnKcOl7_yW7a0IfYBifwqZDdTkQRI"
:local HostStatus "%E2%9D%8C%20%E0%A6%B2%E0%A6%BF%E0%A6%82%E0%A6%95%20%E0%A6%A1%E0%A6%BE%E0%A6%89%E0%A6%A8%0A%0A%E0%A6%A2%E0%A6%BE%E0%A6%95%E0%A6%BE%20%E0%A6%9F%E0%A7%81%20%E0%A6%97%E0%A6%BE%E0%A6%9C%E0%A7%80%E0%A6%AA%E0%A7%81%E0%A6%B0%20%E0%A6%85%E0%A6%AB%E0%A6%BF%E0%A6%B8"
:local Message "%E0%A6%B9%E0%A7%8B%E0%A6%B8%E0%A7%8D%E0%A6%9F:%20$NetHost%0A%E0%A6%85%E0%A6%AC%E0%A6%B8%E0%A7%8D%E0%A6%A5%E0%A6%BE:%20$HostStatus%0A%0A%E0%A6%B8%E0%A6%AE%E0%A6%AF%E0%A6%BC:%20$CurTime%20$CurDate%0A%0A%F0%9F%93%8C%20%E0%A6%A6%E0%A7%8D%E0%A6%B0%E0%A6%B7%E0%A7%8D%E0%A6%9F%E0%A6%AC%E0%A7%8D%E0%A6%AF:%20%E0%A7%A7%20%E0%A6%A5%E0%A7%87%E0%A6%95%E0%A7%87%20%E0%A7%AB%20%E0%A6%AE%E0%A6%BF%E0%A6%A8%E0%A6%BF%E0%A6%9F%20%E0%A6%8F%E0%A6%B8%E0%A6%8F%E0%A6%AE%E0%A6%8F%E0%A6%B8%20%E0%A6%86%E0%A6%B8%E0%A6%9B%E0%A7%87%20%E0%A6%A8%E0%A6%BE"
/tool fetch url="https://api.telegram.org/bot$BotID/sendMessage?chat_id=$CHID&text=$Message" keep-result=no check-certificate=no
}
```

---

## ❓ FAQ & Troubleshooting

<details>
<summary><b>1. Why does MikroTik fail to send Bengali text via Telegram?</b></summary>
MikroTik RouterOS does not natively support non-ASCII Unicode strings in URLs. This tool pre-encodes all Bengali characters into valid percent-encoded UTF-8 format (<code>%E0%A6...</code>), so RouterOS can transmit them cleanly.
</details>

<details>
<summary><b>2. Do I need SSL certificates on MikroTik?</b></summary>
No. The generated script uses <code>check-certificate=no</code> in the <code>/tool fetch</code> command, so no certificate installation is required.
</details>

<details>
<summary><b>3. Which RouterOS version is supported?</b></summary>
The script uses <code>type=icmp</code> and <code>$host</code> syntax which is fully compatible with <strong>RouterOS v7</strong>. For RouterOS v6, change <code>type=icmp</code> to <code>type=simple</code> and <code>$host</code> to <code>$"host"</code>.
</details>

<details>
<summary><b>4. Can I monitor multiple hosts?</b></summary>
Yes! Run the generator once for each host IP, generate a separate script for each, and paste them all into the MikroTik terminal one by one.
</details>

---
---

## 🌟 পরিচিতি

**MikroTik Netwatch Telegram Script Generator** হলো নেটওয়ার্ক ইঞ্জিনিয়ার, ISP এবং সিস্টেম অ্যাডমিনদের জন্য একটি ওয়েব-ভিত্তিক টুল। এটি স্বয়ংক্রিয়ভাবে MikroTik RouterOS v7 Netwatch স্ক্রিপ্ট তৈরি করে, যা মনিটর করা হোস্ট **আপ** ✅ বা **ডাউন** ❌ হলে তাৎক্ষণিক **Telegram নোটিফিকেশন** পাঠায়।

### ✨ বিশেষ সুবিধা
- 🇧🇩 **পূর্ণ বাংলা ও UTF-8 সাপোর্ট** — MikroTik `/tool fetch` URL এনকোডিং সমস্যার সমাধান।
- ⚡ **এক ক্লিকে স্ক্রিপ্ট তৈরি** — ফর্ম পূরণ করুন, সাথে সাথে পূর্ণ RouterOS স্ক্রিপ্ট পান।
- 📋 **এক ক্লিকে কপি** — ক্লিপবোর্ডে সরাসরি কপি করুন।
- 🕒 **ডায়নামিক সময় ও তারিখ** — রাউটার ক্লক থেকে `$CurTime` ও `$CurDate` স্বয়ংক্রিয়ভাবে যুক্ত হয়।
- 📏 **অপশনাল লিঙ্ক দূরত্ব** — ফাইবার/ক্যাবলের মিটার তথ্য অ্যালার্টে যোগ করুন।
- 🔒 **SSL সেটআপ লাগবে না** — `check-certificate=no` ব্যবহার করা হয়।

---

## 🚀 লাইভ ডেমো

🔗 **[https://sohag1192.github.io/MikroTik-Netwatch-script/](https://sohag1192.github.io/MikroTik-Netwatch-script/)**

---

## 🤖 Telegram বট সেটআপ (ধাপে ধাপে)

### ধাপ ১ — বট তৈরি ও টোকেন সংগ্রহ
1. Telegram-এ **[@BotFather](https://t.me/BotFather)** খুঁজুন।
2. `/newbot` পাঠান এবং নির্দেশনা অনুসরণ করুন।
3. **HTTP API Token** কপি করুন (যেমন: `719600063280:AAFhAgYxnKcOl7_yW7a0IfYBifwqZDdTkQRI`)।
> ⚠️ টোকেন কাউকে শেয়ার করবেন না!

### ধাপ ২ — Chat ID সংগ্রহ

**ব্যক্তিগত চ্যাট:**
1. **[@userinfobot](https://t.me/userinfobot)**-এ মেসেজ করুন — সাথে সাথে আপনার ID পাবেন।
2. আপনার তৈরি বটে `/start` পাঠান।

**গ্রুপ / চ্যানেল (টিমের জন্য প্রস্তাবিত):**
1. একটি গ্রুপ/চ্যানেল তৈরি করুন (যেমন: `NOC Alerts`) এবং বটকে **Admin** করুন।
2. গ্রুপে যেকোনো মেসেজ পাঠান।
3. ব্রাউজারে এই URL খুলুন:
   ```
   https://api.telegram.org/bot<YOUR_BOT_TOKEN>/getUpdates
   ```
4. `"chat":{"id": -100xxxxxxxxxx}` খুঁজুন।
> 💡 গ্রুপ/চ্যানেল ID সবসময় `-` দিয়ে শুরু হয় (যেমন: `-1002700089369`)। পুরো নম্বরটি কপি করুন।

### ধাপ ৩ — বট টেস্ট করুন
```
https://api.telegram.org/bot<YOUR_BOT_TOKEN>/sendMessage?chat_id=<YOUR_CHAT_ID>&text=Test
```
যদি Telegram-এ "Test" আসে — সেটআপ সম্পন্ন! 🎉

---

## 🛠️ জেনারেটর ব্যবহার পদ্ধতি

| # | ফিল্ড | উদাহরণ |
|---|-------|---------|
| ১ | **Host IP Address** | `192.168.13.46` |
| ২ | **Comment / English Name** | `DHAKA TO GAZIPUR LINK` |
| ৩ | **Bengali Location Name** | `ঢাকা টু গাজীপুর অফিস` |
| ৪ | **লিঙ্ক টোটাল মিটার** *(অপশনাল)* | `১৫০০` |
| ৫ | **Bot Token** | `719600063280:AAFh...` |
| ৬ | **Chat ID** | `-1002700089369` |

তারপর **⚡ Generate Script** → **📋 Copy Code** চাপুন।

---

## 💻 MikroTik RouterOS-এ স্ক্রিপ্ট প্রয়োগ

### পদ্ধতি ১ — Winbox Terminal *(সবচেয়ে দ্রুত)*
1. **Winbox** খুলুন → রাউটারে সংযুক্ত হন।
2. **New Terminal** খুলুন।
3. জেনারেট করা স্ক্রিপ্ট পেস্ট করুন → `Enter` চাপুন।

### পদ্ধতি ২ — Winbox GUI
1. **Tools → Netwatch → + (Add)** যান।
2. পূরণ করুন:
   - **Host:** টার্গেট IP
   - **Type:** `icmp`
   - **Interval:** `00:01:00`
   - **Timeout:** `1s`
   - **Comment:** লিঙ্কের নাম
3. **Up** ট্যাবে `up-script` অংশ পেস্ট করুন।
4. **Down** ট্যাবে `down-script` অংশ পেস্ট করুন।
5. **Apply → OK** চাপুন।

---

## ❓ সাধারণ প্রশ্ন ও সমাধান

<details>
<summary><b>১. MikroTik বাংলা টেক্সট Telegram-এ পাঠাতে পারে না কেন?</b></summary>
MikroTik RouterOS URL-এ non-ASCII Unicode সরাসরি সাপোর্ট করে না। এই টুল সব বাংলা অক্ষর আগে থেকেই percent-encoded UTF-8 ফরম্যাটে (<code>%E0%A6...</code>) রূপান্তরিত করে দেয়, ফলে RouterOS সহজেই Telegram-এ পাঠাতে পারে।
</details>

<details>
<summary><b>২. MikroTik-এ SSL সার্টিফিকেট লাগবে?</b></summary>
না। স্ক্রিপ্টে <code>check-certificate=no</code> ব্যবহার করা হয়, তাই আলাদা সার্টিফিকেট ইনস্টলের দরকার নেই।
</details>

<details>
<summary><b>৩. কোন RouterOS ভার্সন সাপোর্টেড?</b></summary>
স্ক্রিপ্টে <code>type=icmp</code> ও <code>$host</code> ব্যবহার করা হয় যা <strong>RouterOS v7</strong>-এর সাথে সম্পূর্ণ সামঞ্জস্যপূর্ণ।
</details>

<details>
<summary><b>৪. একাধিক হোস্ট মনিটর করা যাবে?</b></summary>
হ্যাঁ! প্রতিটি হোস্টের জন্য আলাদাভাবে স্ক্রিপ্ট জেনারেট করুন এবং একে একে MikroTik Terminal-এ পেস্ট করুন।
</details>

---

## 📈 Repository Statistics

| Metric | Status |
| :--- | :--- |
| **Total Visits / Hits** | ![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fsohag1192%2FMikroTik-Netwatch-script&count_bg=%232563EB&title_bg=%231E293B&icon=github.svg&icon_color=%23E2E8F0&title=hits&edge_flat=false) |
| **Maintained By** | [@sohag1192](https://github.com/sohag1192) |

---

## 📄 License

This project is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute it.
