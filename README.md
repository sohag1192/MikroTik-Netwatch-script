# 📡 MikroTik Netwatch Telegram Script Generator

<p align="center">
  <img src="https://img.shields.io/badge/MikroTik-RouterOS%20v6%20%2F%20v7-00599C?style=for-the-badge&logo=mikrotik&logoColor=white" alt="MikroTik" />
  <img src="https://img.shields.io/badge/Telegram-Bot%20API-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white" alt="Telegram" />
  <img src="https://img.shields.io/badge/Language-HTML5%20%2F%20JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black" alt="JS" />
  <br/>
  <!-- Visitor & Hit Counters -->
  <a href="https://github.com/sohag1192/MikroTik-Netwatch-script">
    <img src="https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fsohag1192%2FMikroTik-Netwatch-script&count_bg=%232563EB&title_bg=%231E293B&icon=github.svg&icon_color=%23E2E8F0&title=Total+Hits&edge_flat=false" alt="Total Hits" />
  </a>
  <img src="https://komarev.com/ghpvc/?username=sohag1192-mikrotik-netwatch&label=Total+Views&color=2563eb&style=flat-square" alt="Visitors Count" />
  <img src="https://img.shields.io/github/stars/sohag1192/MikroTik-Netwatch-script?style=flat-square&color=yellow" alt="Stars" />
  <img src="https://img.shields.io/github/forks/sohag1192/MikroTik-Netwatch-script?style=flat-square&color=blue" alt="Forks" />
  <img src="https://img.shields.io/github/license/sohag1192/MikroTik-Netwatch-script?style=flat-square" alt="License" />
</p>

---

## 🌟 Overview

**MikroTik Netwatch Telegram Script Generator** is a web-based automation tool designed for network engineers, ISPs, and system administrators. It automatically generates ready-to-run MikroTik Netwatch scripts that send instant **Telegram notifications** when a monitored host (gateway, radio link, customer router, optical fiber point) goes **UP** or **DOWN**.

### ✨ Highlights
- 🇧🇩 **Full Bengali (বাংলা) & UTF-8 Support:** Solves the common MikroTik `/tool fetch` URL encoding issue for Unicode/Bengali text.
- ⚡ **One-Click Script Generation:** Enter host IP, custom names, distance in meters, and credentials to get a complete script instantly.
- 📋 **One-Click Copy:** Easily copy the generated RouterOS command directly to your clipboard.
- 🕒 **Dynamic Time & Date:** Automatically pulls router clock `$CurTime` and `$CurDate` for incident reporting.
- 📏 **Optional Fiber/Link Distance:** Include link meter/distance info for quick field response.

---

## 🚀 Live Demo

You can host and use this tool directly in your browser:
🔗 **[Live Web Tool](https://sohag1192.github.io/MikroTik-Netwatch-script/)**

---

## 🤖 How to Configure Telegram Bot (Step-by-Step)

To receive alert notifications on Telegram, you need a **Bot Token** and a **Chat ID**. Follow these steps:

### 1️⃣ Step 1: Create a Telegram Bot & Get Bot Token
1. Open your Telegram app and search for **[@BotFather](https://t.me/BotFather)**.
2. Click **Start** or send `/start`.
3. Send `/newbot` to create a new bot.
4. Provide a name for your bot (e.g., `My Network Monitor Bot`).
5. Choose a username ending in `bot` (e.g., `mynetwatch_alert_bot`).
6. **BotFather** will generate an **HTTP API Token** (e.g., `719600063280:AAFhAgYxnKcOl7_yW7a0IfYBifwqZDdTkQRI`).
   > ⚠️ **Important:** Keep this token private and secure!

---

### 2️⃣ Step 2: Get Your Telegram Chat ID
You can receive alerts in a **Personal Chat**, **Group**, or **Channel**.

#### Option A: Personal Chat ID
1. Search for **[@userinfobot](https://t.me/userinfobot)** or **[@getidsbot](https://t.me/getidsbot)** in Telegram.
2. Click **Start**. The bot will immediately reply with your numeric `Id` (e.g., `123456789`).
3. Send `/start` to your newly created bot so it has permission to message you.

#### Option B: Group or Channel Chat ID (Recommended for Teams)
1. Create a new Telegram Group or Channel (e.g., `NOC Alerts`).
2. Add your newly created bot to the group/channel as an **Administrator**.
3. Send any test message in the group (e.g., `hello`).
4. To find the Group Chat ID:
   - Forward any message from the group to **[@getidsbot](https://t.me/getidsbot)**, OR
   - Open your web browser and visit:
     ```text
     https://api.telegram.org/bot<YOUR_BOT_TOKEN>/getUpdates
     ```
   - Look for `"chat":{"id": -100xxxxxxxxxx}`.
   > 💡 Group and Channel IDs typically start with a minus sign (`-` or `-100`). Make sure to copy the entire number including the `-` sign (e.g., `-1002700089369`).

---

### 3️⃣ Step 3: Test Your Bot
You can test if your bot works by opening this URL in your web browser (replace with your actual Bot Token and Chat ID):
```text
https://api.telegram.org/bot<YOUR_BOT_TOKEN>/sendMessage?chat_id=<YOUR_CHAT_ID>&text=Test+Message+from+Netwatch
```
If your bot sends "Test Message from Netwatch" to your Telegram, your setup is complete! 🎉

---

## 🛠️ How to Use the Generator

1. **Host IP Address:** Enter the target IP to monitor (e.g. `192.168.13.46`).
2. **Comment / English Name:** A brief English identifier (e.g. `DHAKA TO GAZIPUR LINK`).
3. **Bengali Location Name:** The full Bengali name for alert messages (e.g. `ঢাকা টু গাজীপুর অফিস`).
4. **Link Total Meter (Optional):** Fiber distance in meters (e.g. `1500`).
5. **Bot Token:** Paste your Telegram bot token.
6. **Chat ID:** Paste your Telegram personal or group Chat ID.
7. Click **⚡ Generate Script**.
8. Click **📋 Copy Code**.

---

## 💻 How to Apply in MikroTik RouterOS

### Method 1: Using Winbox Terminal (Fastest)
1. Open **Winbox** and connect to your MikroTik Router.
2. Open **New Terminal**.
3. Paste the generated code and press `Enter`.
4. Done!

### Method 2: Using Winbox GUI
1. In Winbox, go to **Tools** -> **Netwatch**.
2. Click **+ (Add)**.
3. Fill in:
   - **Host:** `Host IP`
   - **Interval:** `00:01:00`
   - **Timeout:** `1000ms`
   - **Comment:** Your comment
4. Paste the generated `Up` script into the **Up** tab.
5. Paste the generated `Down` script into the **Down** tab.
6. Click **Apply** & **OK**.

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
:local Message "%E0%A6%B9%E0%A7%8B%E0%A6%B8%E0%A7%8D%E0%A6%9F:%20$NetHost%0A%E0%A6%85%E0%A6%AC%E0%A6%B8%E0%A7%8D%E0%A6%A5%E0%A6%BE:%20$HostStatus%0A%0A%E0%A6%B8%E0%A6%AE%E0%A6%AF%E0%A6%BC:%20$CurTime%20$CurDate%0A%F0%9F%93%8F%20%E0%A6%B2%E0%A6%BF%E0%A6%82%E0%A6%95%20%E0%A6%A6%E0%A7%82%E0%A6%B0%E0%A6%A4%E0%A7%8D%E0%A6%AC:%201500%20%E0%A6%AE%E0%A6%BF%E0%A6%9F%E0%A6%BE%E0%A6%B0"
/tool fetch url="https://api.telegram.org/bot$BotID/sendMessage?chat_id=$CHID&text=$Message" keep-result=no check-certificate=no
} down-script={
:local CurDate [/system clock get date]
:local CurTime [/system clock get time]
:local NetHost $host
:local CHID "-1002700089369209"
:local BotID "719600063280:AAFhAgYxnKcOl7_yW7a0IfYBifwqZDdTkQRI"
:local HostStatus "%E2%9D%8C%20%E0%A6%B2%E0%A6%BF%E0%A6%82%E0%A6%95%20%E0%A6%A1%E0%A6%BE%E0%A6%89%E0%A6%A8%0A%0A%E0%A6%A2%E0%A6%BE%E0%A6%95%E0%A6%BE%20%E0%A6%9F%E0%A7%81%20%E0%A6%97%E0%A6%BE%E0%A6%9C%E0%A7%80%E0%A6%AA%E0%A7%81%E0%A6%B0%20%E0%A6%85%E0%A6%AB%E0%A6%BF%E0%A6%B8"
:local Message "%E0%A6%B9%E0%A7%8B%E0%A6%B8%E0%A7%8D%E0%A6%9F:%20$NetHost%0A%E0%A6%85%E0%A6%AC%E0%A6%B8%E0%A7%8D%E0%A6%A5%E0%A6%BE:%20$HostStatus%0A%0A%E0%A6%B8%E0%A6%AE%E0%A6%AF%E0%A6%BC:%20$CurTime%20$CurDate%0A%0A%F0%9F%93%8C%20%E0%A6%A6%E0%A7%8D%E0%A6%B0%E0%A6%B7%E0%A7%8D%E0%A6%9F%E0%A6%AC%E0%A7%8D%E0%A6%AF:%20%E0%A7%A7%20%E0%A6%A5%E0%A7%87%E0%A6%95%E0%A7%87%20%E0%A7%AB%20%E0%A6%AE%E0%A6%BF%E0%A6%A8%E0%A6%BF%E0%A6%9F%20%E0%A6%8F%E0%A6%B8%E0%A6%8F%E0%A6%AE%E0%A6%8F%E0%A6%B8%20%E0%A6%86%E0%A6%B8%E0%A6%9B%E0%A7%87%20%E0%A6%A8%E0%A6%BE,%20%E0%A6%A4%E0%A6%BE%E0%A6%B0%E0%A6%AA%E0%A6%B0%20%E0%A6%B2%E0%A6%BF%E0%A6%99%E0%A7%8D%E0%A6%95%E0%A6%9F%E0%A6%BF%20%E0%A6%A1%E0%A6%BE%E0%A6%89%E0%A6%A8%20%E0%A6%B9%E0%A6%AF%E0%A6%BC%E0%A7%87%20%E0%A6%97%E0%A7%87%E0%A6%9B%E0%A7%87%E0%A7%A4%0A%F0%9F%93%8F%20%E0%A6%B2%E0%A6%BF%E0%A6%82%E0%A6%95%20%E0%A6%A6%E0%A7%82%E0%A6%B0%E0%A6%A4%E0%A7%8D%E0%A6%AC:%201500%20%E0%A6%AE%E0%A6%BF%E0%A6%9F%E0%A6%BE%E0%A6%B0"
/tool fetch url="https://api.telegram.org/bot$BotID/sendMessage?chat_id=$CHID&text=$Message" keep-result=no check-certificate=no
}
```

---

## ❓ FAQ & Troubleshooting

<details>
<summary><b>1. Why does MikroTik fail to send Telegram messages with Bengali text?</b></summary>
MikroTik's internal scripting engine does not natively support non-ASCII Unicode strings in URLs. This tool pre-encodes all Bengali characters into valid percent-encoded UTF-8 format (`%E0%A6...`), allowing RouterOS to cleanly transmit the message to Telegram without errors.
</details>

<details>
<summary><b>2. Do I need SSL certificates installed on MikroTik?</b></summary>
The script includes `check-certificate=no` in the `/tool fetch` command, so you do not need to install certificates manually.
</details>

<details>
<summary><b>3. Does this work on both RouterOS v6 and v7?</b></summary>
Yes! The syntax generated is 100% compatible with RouterOS v6.x and RouterOS v7.x.
</details>

---

## 📈 Repository Statistics

| Metric | Status |
| :--- | :--- |
| **Total Visits / Hits** | ![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fsohag1192%2FMikroTik-Netwatch-script&count_bg=%232563EB&title_bg=%231E293B&icon=github.svg&icon_color=%23E2E8F0&title=hits&edge_flat=false) |
| **Unique Visitors** | ![Views](https://komarev.com/ghpvc/?username=sohag1192-mikrotik-netwatch&label=views&color=2563eb&style=flat-square) |
| **Maintained By** | [@sohag1192](https://github.com/sohag1192) |

---

## 📄 License

This project is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute it in your network environments.
