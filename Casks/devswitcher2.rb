cask "devswitcher2" do
  version "2.5.1"
  sha256 "c5f2eae4aa084e7991052c5093c63af3ddd02b0693c38e4e3657b6de121ad59d"

  url "https://github.com/vaspike/DevSwitcher2/releases/download/v#{version}/DevSwitcher2-#{version}.dmg"
  name "DevSwitcher2"
  desc "Efficient and elegant macOS window switching tool"
  homepage "https://github.com/vaspike/DevSwitcher2"

  # Minimum system requirements for the app
  depends_on macos: ">= :monterey"

  app "DevSwitcher2.app"

  # Cleanup operations during uninstall
  uninstall quit: "com.rivermao.DevSwitcher2",
            delete: "/Applications/DevSwitcher2.app"

  # Conflicts with other versions
  # conflicts_with cask: [
  #   "devswitcher2@2.5.1"
  # ]

  # Preflight to handle existing installations
  preflight do
    if File.exist?("/Applications/DevSwitcher2.app")
      system_command "rm", args: ["-rf", "/Applications/DevSwitcher2.app"]
    end
  end

  # User notices
  caveats <<~EOS
    DevSwitcher2 requires Accessibility permissions to function properly.
    > DevSwitcher2 需要辅助功能权限才能正常工作。

    On first launch, please follow the in-app guidance to grant permissions at:
    System Preferences → Security & Privacy → Privacy → Accessibility
    > 首次启动时，请按照应用内的指引在以下位置授予权限：
    > 系统偏好设置 → 安全性与隐私 → 隐私 → 辅助功能

    Default hotkeys / 默认快捷键：
    - Command + ` (backtick): Switch between windows within the same app
      Command + ` (反引号): 同应用内窗口切换
    - Command + Tab: Switch between applications (needs to be enabled in preferences)
      Command + Tab: 应用间切换（需要在偏好设置中启用）

    For more information / 更多信息: https://github.com/vaspike/DevSwitcher2
  EOS
end 
