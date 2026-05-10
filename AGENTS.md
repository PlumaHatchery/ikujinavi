# AGENTS.md - Parenting Goods Navi Workspace

このworkspaceは、育児グッズナビのSEO調査、カテゴリ整理、商品比較、記事案作成を管理するための作業場所です。

## Purpose

- 育児グッズナビのSEO調査を行う。
- 育児グッズを悩み別・カテゴリ別に整理する。
- 商品比較、比較記事、レビュー記事、ランキング記事の土台を作る。
- 記事案、構成案、比較軸、商品調査メモを管理する。

## Scope

扱うもの:

- 育児グッズのカテゴリ整理。
- 悩み別の導線設計。
- SEOキーワード候補。
- 商品比較軸。
- 記事タイトル案。
- 記事構成案。
- 比較表の下書き。
- 商品ページ調査メモ。

扱いに注意するもの:

- 医療的助言。
- 安全性に関する断定。
- 発達・健康に関する表現。
- 実購入を強く促す表現。
- 価格、在庫、レビュー数など変動する情報。

## Main Tasks

- SEOキーワード調査。
- カテゴリマップ作成。
- 悩み別マップ作成。
- 商品比較メモ作成。
- 比較記事・レビュー記事・ランキング記事の案作成。
- 記事構成テンプレート作成。
- 比較基準の整理。
- 注意表現・NG表現の整理。

## Rules

- 日本語で回答する。
- 小さい手順で進める。
- 破壊的操作は必ず確認する。
- 外部サービス連携は必ず確認する。
- 育児グッズナビについては、Kaoruの包括許可により、安全な範囲の変更はcommit / GitHub pushしてよい。
- APIキー、トークン、認証URL、環境変数、秘密ファイルの内容を表示しない。
- 医療・安全・育児アドバイス表現は慎重に扱う。
- 商品価格、在庫、レビュー数、ランキングは変動するため、記事化前に再確認する前提で書く。
- 「絶対おすすめ」「必ず安全」「これ一択」などの断定表現は避ける。
- 実購入誘導は慎重にする。
- 公式情報、メーカー情報、信頼できる情報源を優先する。
- 不確実な情報は断定しない。
- 重い調査や大量処理はMac mini向き作業として切り出す。

## Raspberry Pi Operating Style

ラズパイでは軽い作業を中心にする:

- Markdown作成・整理。
- 軽いWeb調査。
- SEOキーワード候補整理。
- カテゴリ整理。
- 記事案作成。
- 商品比較軸の整理。
- 小さなgit操作。

避ける作業:

- Playwrightの本格実行。
- 大量の商品ページクロール。
- 重いNext.jsビルド。
- 大量スクレイピング。
- 画像処理。
- 長時間ブラウザ自動操作。

## Safety and Accuracy

記事化前に再確認が必要なもの:

- 価格。
- 在庫。
- レビュー数。
- 対象月齢。
- 安全基準。
- リコール情報。
- 販売終了・仕様変更。
- メーカー公式情報。

表現方針:

- 読者の判断を助ける。
- 不安を煽らない。
- 断定しすぎない。
- 個別事情により向き不向きがある前提で書く。
- 医療・健康・安全に関わる内容は公式情報確認を促す。

## Slack Notes

For parenting goods work, use Slack to confirm before external actions, GitHub push, cron registration, heavy crawling, or large product research.

Flag medical, health, development, safety, affiliate, ranking, or strong purchase recommendation concerns before article use.

When asking for review, include recheck points such as price, stock, review count, target age, recalls, and official product information.

## Daily Log

日次ログは `memory/YYYY-MM-DD.md` に書く。

記録するもの:

- 調査したカテゴリ。
- 追加したキーワード候補。
- 商品比較メモ。
- 記事案。
- 注意すべき表現。
- 次に確認すること。

## Output Style

- 簡潔に。
- 比較軸を明確にする。
- 次の一手を1つ示す。
- 不確実性と再確認ポイントを明示する。

## Completion and Approval Flow

- ファイル変更を行った作業の最後には、Slackで「変更内容・未commit状態・次に必要な判断」を明示する。
- 育児グッズナビについては、安全な範囲の変更ならcommit / pushしてよい。大きな方針変更、外部サービス連携、課金、広告、cron、APIキー設定は事前確認する。
- Web検索に進む場合は、検索範囲と検索キーワードを提示して承認を求める。
- Playwright、cron、GitHub push、外部投稿、APIキー設定は必ず明示承認を求める。
- 作業完了報告の最後には、単なる要約ではなく「次にKaoruが判断すべきこと」を1つ書く。

## Autonomous Operation Permission

Kaoru has authorized OpenClaw / Clawpi to operate this repo autonomously within safe limits.

Scope:

- Target repo: `~/projects/parenting-goods-navi/` only.
- Allowed: public/free web research, existing file inspection, HTML/CSS/Markdown creation and editing, article ideas, category pages, comparison pages, git status/diff/add/commit/push, and Slack work reports.
- Commit messages should use `openclaw: ...` format.

Hard limits:

- Do not modify files or repos outside `~/projects/parenting-goods-navi/` during this repo's autonomous work.
- Do not force push.
- Do not change git remotes.
- Do not add, change, or delete `CNAME`.
- Do not display, store, or commit secrets, API keys, tokens, or passwords.
- Do not add `node_modules`, build artifacts, huge files, images, or videos without explicit approval.
- Do not change GitHub Pages settings or repository settings.
- Do not post to external SNS or external services.
- Do not do large full-site rewrites in one autonomous run.
- If unsure, ask Kaoru on Slack and stop.

Autonomous run checklist:

1. Check `git status --short` first.
2. Inspect existing file structure before editing.
3. Use only free/public sources unless Kaoru explicitly approves otherwise.
4. Make one small improvement per run.
5. Review `git diff` before commit.
6. If safe, commit and push.
7. After push, report to Slack: changed summary, changed files, commit hash, and next improvement idea.

## Medical, Development, and Safety Wording

For autonomous Parenting Goods Navi work, avoid definitive claims about medical, developmental, or safety topics.

Required wording approach:

- Use cautious framing such as 「一般的には」, 「目安」, 「家庭により異なる」, 「購入前に公式情報を確認」, and 「メーカー説明を確認」.
- Do not independently guarantee safety, development outcomes, accident prevention, sleep safety, or correct use.
- For accident prevention, suffocation, sleep, child seats, baby carriers, strollers, beds, gates, and other safety-related topics, prioritize official information, public-agency guidance, and manufacturer instructions.
- Treat target age, target weight, safety standards, recalls, installation methods, and usage precautions as recheck items before publishing.
- Avoid phrases such as 「必ず安全」, 「絶対に大丈夫」, 「これで防げる」, 「これ一択」, or claims that imply guaranteed outcomes.
