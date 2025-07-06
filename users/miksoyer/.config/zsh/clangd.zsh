# only macOS 
if [ "$(uname)" = "Darwin" ]; then
    # 将 LLVM 工具链加入 PATH
    export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
    
    # 让编译器/链接器找到 Homebrew 的 LLVM
    export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
fi
