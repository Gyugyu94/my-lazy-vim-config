-- ftplugin/dart.lua 내용
-- Flutter 전용 키매핑 설정
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- <leader>F 구조의 키매핑
-- F는 'Flutter'의 직관적인 약자로 사용됩니다.

-- 1. Flutter Run (앱 실행)
map("n", "<leader>FR", ":FlutterRun<CR>", { desc = "Flutter Run" })

-- 2. Flutter Quit (앱 종료)
map("n", "<leader>Fq", ":FlutterQuit<CR>", { desc = "Flutter Quit" })

-- 4. Flutter Hot Restart (완전 재시작)
map("n", "<leader>Fr", ":FlutterRestart<CR>", { desc = "Hot Restart" })

-- 5. Flutter Devices (장치 선택)
map("n", "<leader>Fd", ":FlutterDevices<CR>", { desc = "List Devices" })

-- 6. Flutter Emulators (에뮬레이터 실행)
map("n", "<leader>Fe", ":FlutterEmulators<CR>", { desc = "List Emulators" })

-- 7. Flutter Copy Profiler URL (디버그 URL 복사)
map("n", "<leader>Fp", ":FlutterCopyProfilerUrl<CR>", { desc = "Copy Profiler URL" })

-- 8. Flutter Log Toggle (로그 창 열기/닫기)
map("n", "<leader>Fl", ":FlutterLogToggle<CR>", { desc = "Toggle Log" })

-- 9. Flutter Outline (구조 보기)
map("n", "<leader>Fo", ":FlutterOutlineToggle<CR>", { desc = "Toggle Outline" })
