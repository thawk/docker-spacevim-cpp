if exists("*coc#config")
    call coc#config('coc.preferences', {
                \ "autoTrigger": "always",
                \ "maxCompleteItemCount": 10,
                \ "codeLens.enable": 1,
                \ "diagnostic.virtualText": 1,
                \ "extensionUpdateCheck": "never",
                \})

    "let s:coc_extensions = [
    "			\ 'coc-dictionary',
    "			\ 'coc-json',
    "			\ 'coc-ultisnips',
    "			\ 'coc-tag',
    "            \ 'coc-vimlsp',
    "			\]
    "
    "for extension in s:coc_extensions
    "	call coc#add_extension(extension)
    "endfor
endif
