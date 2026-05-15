# Publishing 育児グッズナビ

公開サイトは GitHub Pages の `gh-pages` ブランチを参照する。
`master` に push しただけでは公開サイトは更新されない。

## 通常手順

1. `master` 側で変更を commit / push する。
2. 次を実行して公開用 `gh-pages` に反映する。

```bash
./scripts/publish-gh-pages.sh
```

このスクリプトは以下のみを `gh-pages` に同期する。

- `index.html`
- `styles.css`
- `articles/`

## 注意

- 公開反映前に `master` の作業ツリーが clean であることを要求する。
- `/tmp/ikujinavi-gh-pages` は公開用 worktree。手作業で `rsync` する場合はコピー先パスを必ず確認する。
- 表示が古い場合は GitHub Pages / ブラウザキャッシュの可能性がある。まず raw の `gh-pages/index.html` を確認する。
