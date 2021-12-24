return {
    filetypes = { 'rust' },
    settings = {
        ['rust-analyzer'] = {}
    },
    checkOnSave = {
        command = 'clippy'
    },
}
