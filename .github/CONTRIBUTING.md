# Contribution Guide

このプロジェクトへのコントリビュート方法についてのガイドです。

## バグの報告

### バグ報告をする前の確認

- バグについては、Github issuesで管理します
 - issueを作成する前に、正しいリポジトリかを確認してください
 - Openになっているissueで、すでに報告されていないかを確認してください

### バグを報告する方法

- バグを報告する場合は、可能な範囲でissue templateの内容に沿って記載してください
- サンプルコードやエラーメッセージ内にAPIキーや個人情報などが含まれていないか確認してください

## 修正の流れ

[GitHub Flow](https://gist.github.com/Gab-km/3705015) に従って開発をします。

1. GithubへPullRequest用のBranchをローカルで作成する
2. データを更新編集し、ローカルに add, commitする
3. Githubにpushする
4. GithubでPullRequestする

### ブランチ作成

master branchから branchを切る。ブランチの命名規約は `(動詞)_(名詞)#(issue番号)`

### WIP(work in progress) PullRequestの作成

ブランチを切ってコミットを始めたら、まずWIPのPullRequestを作成します。 WIPのPullRequestはまだレビューの必要のない作業中のPullRequestで、現在の作業の進捗状況をdiffベースで共有するために作成します。

WIPのPullRequestではタイトルの先頭に"[WIP]"と付け、変更内容に関連するissue(必ずAssigneeを自分に設定すること)を紐付けた上で、実装する内容などを書くようにしてください。可能な範囲でpull request templateの内容に沿って記載してください。

### 機能の作成・バグ修正

修正は定期的にGitHubにpushしましょう。差分や進捗、課題を共有できます。

pushすることで、CIによるテストと静的解析が走ります。修正したらできる限りテストを書き、CIが通ってからレビュー依頼・masterへのマージを行うようにしてください。

### レビュー依頼

レビューする段階になったら、タイトルの"[WIP]"を外します。`review me`のタグをつけます。レビューのポイントをコメントに書いてレビュー依頼をします。

レビューアーはレビュー後に問題なければ `LGTM`タグをつけます。

### master への マージ

LGTMが出たら、`Merge pull request`ボタンを押して masterへのマージをします。マージが完了したら、作業していたブランチは削除します。

### issueを閉じる

コメントをつけてissueをクローズします。commit-messageによる自動クローズ機能もありますが、手動でクローズすることにします。
