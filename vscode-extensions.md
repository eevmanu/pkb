<!-- omit in toc -->
# Extensions

- [Editor UI](#editor-ui)
  - [Readability](#readability)
  - [Productivity](#productivity)
  - [Git](#git)
- [Python](#python)
- [Go](#go)
- [Markdown](#markdown)
- [Personal Knowledge Management](#personal-knowledge-management)
- [JSON](#json)
- [CSV](#csv)
- [Extra tools](#extra-tools)
- [Suggested](#suggested)

## Editor UI

- [Atom One Dark Theme](https://marketplace.visualstudio.com/items?itemName=akamud.vscode-theme-onedark)
- [vscode-icons](https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons)

### Readability

- [Bracket Pair Colorizer 2](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer-2)
- [Bracket Select](https://marketplace.visualstudio.com/items?itemName=chunsen.bracket-select)
  - Remove `BraSel:UndoSelect` shortcut
    - `Atl+Z` + `editorTextFocus`
    - to rollback `Reset keybinding`
- [Scoper](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.scoper)
- [indent-rainbow](https://marketplace.visualstudio.com/items?itemName=oderwat.indent-rainbow)
- [Trailing Spaces](https://marketplace.visualstudio.com/items?itemName=shardulm94.trailing-spaces)
- [Error Lens](https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens)
- [Log File Highlighter](https://marketplace.visualstudio.com/items?itemName=emilast.LogFileHighlighter)
- [Better Comments](https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments)

### Productivity

- [WakaTime](https://marketplace.visualstudio.com/items?itemName=WakaTime.vscode-wakatime)

### Git

- [GitLens - Git supercharge](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)

  ```json
  {
      ...
      "gitlens.codeLens.enabled": false,
      "gitlens.hovers.currentLine.over": "line",
      "gitlens.hovers.enabled": false,
      "gitlens.currentLine.scrollable": false,
      "gitlens.currentLine.pullRequests.enabled": false,
      "gitlens.currentLine.enabled": false,
      ...
  }
  ```

- [Git History Diff](https://marketplace.visualstudio.com/items?itemName=huizhou.githd)

  ```json
  {
      ...
      "githd.blameView.enabled": false,
      ...
  }
  ```

- [Git Graph](https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph)


## Python

- [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- [Pylance](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance)

## Go

- [Go](https://marketplace.visualstudio.com/items?itemName=golang.go)

## Markdown

- [Markdown Preview Github Styling](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-preview-github-styles)
- [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
  - Remove `markdown.extension.editing.toggleBold` shortcut
    - `Ctrl+b` + `editorTextFocus && !editorReadonly && editorLangId == 'markdown'`
  - Remove `Markdown: Open Preview` shortcut
    - `Ctrl+Shift+V` + `!notebookEditorFocused && editorLangId == 'markdown'`
  - Remove `markdown.extension.togglePreviewm` shortcut
    - `Ctrl+Shift+V` + `!terminalFocus`
  - Remove `markdown.extension.editing.toggleHeadingUp` shortcut
    - `Ctrl+Shift+[` + `editorTextFocus && !editorReadonly && editorLangId == 'markdown'`
  - Remove `markdown.extension.editing.toggleHeadingDown` shortcut
    - `Ctrl+Shift+]` + `editorTextFocus && !editorReadonly && editorLangId == 'markdown'`
  - Use `Table Formatter` shortcut
    - `Ctrl+Shift+I`
- [Auto Markdown TOC](https://marketplace.visualstudio.com/items?itemName=huntertran.auto-markdown-toc)
  - Issue to take into account: [Adding a TOC ignore above the TOC removes unique settings](https://github.com/huntertran/markdown-toc/issues/41)
  - If you insert / create a TOC, if you pass `depthfrom` field as unique settings, this will miswork with `ignore:true` statements
- [Markdown Table Prettifier](https://marketplace.visualstudio.com/items?itemName=darkriszty.markdown-table-prettify) - Transforms markdown tables to be more readable.

## Personal Knowledge Management

- [Markdown Preview Enhanced](https://marketplace.visualstudio.com/items?itemName=shd101wyy.markdown-preview-enhanced)
- [Markdown Notes](https://marketplace.visualstudio.com/items?itemName=kortina.vscode-markdown-notes)
- [Markdown Links](https://marketplace.visualstudio.com/items?itemName=tchayen.markdown-links)
- [Paste Image](https://marketplace.visualstudio.com/items?itemName=mushan.vscode-paste-image)
- [Paste URL](https://marketplace.visualstudio.com/items?itemName=kukushi.pasteurl)

  ```json
  {
      ...
      {
          "key": "ctrl+v",
          "command": "pasteURL.PasteURL",
          "when": "editorTextFocus && !editorReadonly && editorLangId == 'markdown'"
      },
      {
          "key": "ctrl+alt+p",
          "command": "-pasteURL.PasteURL"
      },
      ...
  }
  ```

## JSON
- [JSON Tools](https://marketplace.visualstudio.com/items?itemName=eriklynd.json-tools)
- [vscode-json](https://marketplace.visualstudio.com/items?itemName=andyyaldoo.vscode-json)

## CSV

- [Rainbow CSV](https://marketplace.visualstudio.com/items?itemName=mechatroner.rainbow-csv)
- [Edit csv](https://marketplace.visualstudio.com/items?itemName=janisdd.vscode-edit-csv) - extension to edit csv files with a table ui

## Extra tools

- [:emojisense:](https://marketplace.visualstudio.com/items?itemName=bierner.emojisense)
- [REST Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client)
- [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
- [Jupyter](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter)
- [Data Preview](https://marketplace.visualstudio.com/items?itemName=RandomFractalsInc.vscode-data-preview)
- [File Utils](https://marketplace.visualstudio.com/items?itemName=sleistner.vscode-fileutils)
- [Sort lines](https://marketplace.visualstudio.com/items?itemName=Tyriar.sort-lines)
- [Align by RegEx](https://marketplace.visualstudio.com/items?itemName=janjoerke.align-by-regex)
- [vscode-input-sequence](https://marketplace.visualstudio.com/items?itemName=tomoki1207.vscode-input-sequence)
- [CodeTour](https://marketplace.visualstudio.com/items?itemName=vsls-contrib.codetour)
- [Live Share Extension Pack](https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare-pack) - Collection of extensions that enable real-time collaborative development with VS Live Share.

## Suggested

- [Bookmarks](https://marketplace.visualstudio.com/items?itemName=alefragnani.Bookmarks)
- [Todo Tree](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree)
- [Ascii Tree Generator](https://marketplace.visualstudio.com/items?itemName=aprilandjan.ascii-tree-generator)
- [Polacode](https://marketplace.visualstudio.com/items?itemName=pnp.polacode)
- [CodeSnap](https://marketplace.visualstudio.com/items?itemName=adpyke.codesnap#review-details)
- [TabNine](https://marketplace.visualstudio.com/items?itemName=TabNine.tabnine-vscode)
- [Thinking in Code](https://marketplace.visualstudio.com/items?itemName=lostintangent.thinking-in-code)
- [Draw.io Integration](https://marketplace.visualstudio.com/items?itemName=hediet.vscode-drawio) - This unofficial extension integrates Draw.io into VS Code.
