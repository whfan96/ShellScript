# ShellScript

## 練習作業專案

本專案包含多個 Shell Script 範例與練習題，涵蓋條件判斷、迴圈、陣列、函數、網路設定及系統管理等主題。
適合用來學習及實作 Linux Bash 腳本。


## 使用說明

1. 在 Linux 環境（如虛擬機）中開啟終端機。
2. 進入專案資料夾，例如：

```bash
cd ~/hw
```

3. 確保腳本有執行權限：

```bash
chmod u+x *.sh
```

4. 執行腳本範例，例如：

```bash
./hw_3-2-1.sh
```

或直接用 Bash 執行：

```bash
bash hw_3-2-1.sh
```

## 系統需求

- Linux 系統，建議使用 Bash 4.x 以上版本。
    - 開發版本 GNU bash, version 5.1.16(1)-release (x86_64-pc-linux-gnu)
- 權限允許執行腳本及更改系統設定（部分腳本可能需要 `sudo` 權限）。

## 練習內容

- 基本條件判斷（if、case）
- 各式迴圈（for、while、until）
- 陣列與函數使用
- 日期與閏年判斷
- 網路配置自動化腳本
- 系統資源監控與文字處理

## 老師資訊

- 張瑋麟
- Email: weilin.jang@gmail.com

## 預設選單功能說明

部分腳本內建了簡單的選單介面，使用者執行腳本後，可以依照選單提示輸入數字或字母，來選擇不同的功能或測試項目。

### 使用範例

執行選單腳本：

```bash
./menu_hw_select.sh
```
