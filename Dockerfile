# 階段一：向官方鏡像「借」已經編譯好的精美網頁檔案
FROM excalidraw/excalidraw:latest AS official_source

# 階段二：建立你專屬的超輕量網頁伺服器（Alpine 版本記憶體只佔約 10MB）
FROM nginx:alpine

# 核心關鍵：把官方網頁檔案複製到你新容器的網頁根目錄
COPY --from=official_source /usr/share/nginx/html /usr/share/nginx/html

# 開放 80 連接埠
EXPOSE 80

# 啟動 Nginx 伺服器
CMD ["nginx", "-g", "daemon off;"]