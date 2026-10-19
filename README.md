# Dotfiles

Cấu hình cá nhân cho Linux và WSL. Hiện repo quản lý Starship; có thể clone vào bất kỳ thư mục nào.

## Cấu trúc

```text
dotfiles/
├── starship/starship.toml
└── scripts/install
```

## Yêu cầu

- Bash và các tiện ích GNU thông thường trên Linux/WSL.
- Starship đã được cài và khởi tạo trong shell.
- Terminal dùng Nerd Font để hiển thị đầy đủ icon.

Với Zsh, thêm dòng sau vào `~/.zshrc` **một lần** nếu chưa có:

```sh
eval "$(starship init zsh)"
```

Repo không tự cài phần mềm, tải font hoặc thay đổi `.zshrc`.

## Cài đặt

Chạy từ thư mục repo:

```sh
./scripts/install
```

Script tạo symlink:

```text
${XDG_CONFIG_HOME:-$HOME/.config}/starship.toml → <repo>/starship/starship.toml
```

Nếu đích đã tồn tại, script sao lưu trước khi thay thế, giữ cả symlink cũ.
Bản sao nằm ngoài repo, trong
`${XDG_STATE_HOME:-$HOME/.local/state}/dotfiles/backups/<thời-điểm>-<mã>/starship.toml`.
Script in đường dẫn chính xác sau khi cài.
Chạy lại khi symlink đã đúng sẽ không tạo thêm bản sao.

Các biến XDG chỉ được dùng nếu là đường dẫn tuyệt đối; giá trị rỗng hoặc tương đối dùng đường dẫn mặc định.
Nếu đặt `STARSHIP_CONFIG` riêng, Starship sẽ dùng đường dẫn đó; bỏ biến này nếu muốn dùng cấu hình vừa cài.

Nhấn Enter để thấy prompt mới. Đừng di chuyển hoặc xóa checkout sau khi cài;
nếu đổi chỗ repo, chạy lại `scripts/install` ở vị trí mới.

## Tùy chỉnh

Sửa `starship/starship.toml` trong repo; symlink làm thay đổi có hiệu lực trực tiếp.

- Prompt một dòng, không có khối nền; bên phải chỉ có giờ `HH:MM`.
- Logo OS màu cam; đường dẫn xanh; Git dùng màu trạng thái.
- Logo công nghệ dùng màu nhận diện; phiên bản và tên môi trường dùng màu trung tính.
- Module ngôn ngữ xuất hiện tùy project và công cụ đã cài.
- Môi trường Python đang kích hoạt được hiển thị, kể cả `.venv` do uv tạo:

```sh
source .venv/bin/activate
```

uv và các ngôn ngữ được cài riêng. Repo không chứa môi trường `.venv`.
Cấu hình đã được kiểm tra với Starship 1.22.1; mục `cpp` chưa hoạt động trên bản này.
Logo OS hiện dùng màu Ubuntu cố định; đổi `[os].style` nếu muốn phối màu cho OS khác.

## Khôi phục

Chọn một bản sao từ đường dẫn script đã in. Thay đường dẫn ví dụ dưới đây bằng đường dẫn bản sao thật.
Gỡ symlink hiện tại rồi chuyển bản sao về vị trí cũ:

```sh
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
# Nếu XDG_CONFIG_HOME đang là đường dẫn tương đối, dùng "$HOME/.config".
ls -l "$config_dir/starship.toml"
# Chỉ tiếp tục khi đây là symlink do scripts/install tạo.
unlink "$config_dir/starship.toml"
mv -- /duong/dan/ban-sao/starship.toml "$config_dir/starship.toml"
```

Nếu trước khi cài chưa có cấu hình, chỉ cần gỡ symlink để quay lại mặc định.

## GitHub

Tạo repo trống trên GitHub rồi thêm remote và đẩy nhánh `main`.
Trước mỗi commit, xem `git diff --cached`; chỉ thêm cấu hình dự định chia sẻ.
Không đưa token, mật khẩu, private key, lịch sử shell, dữ liệu đăng nhập hoặc thư mục trạng thái vào repo.
