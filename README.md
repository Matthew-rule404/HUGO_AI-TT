# HUGO_AI-TT
Trick and tools.

---

## pyenv-virtualenv：何者？どう使う？（venvとの違い）

* **役割**：pyenv に **仮想環境管理**（作成/一覧/有効化/自動有効化/削除）を追加する公式プラグイン。
  `pyenv virtualenv`, `pyenv activate`, `pyenv deactivate`, `pyenv virtualenvs`, `pyenv virtualenv-delete` などのコマンドを提供します。([GitHub][6])
* **venvとの関係**：別物ではあるが、**内部で `python -m venv`（または `virtualenv` / `conda`）を呼び出すラッパー**。つまり **venv を使った環境も pyenv の流儀で一元管理**できます。`virtualenv` が無ければ `venv` を使います。([GitHub][6])
* **強み**：

  1. **Pythonバージョン切替（pyenv）と仮想環境切替が統合**
  2. `eval "$(pyenv virtualenv-init -)"` を入れると **ディレクトリ移動で自動アクティベート**（`.python-version` に環境名を書くだけ）。([GitHub][6])

### 主なコマンド例

```bash
# 作成（指定バージョンから）
pyenv virtualenv 3.13.6 myenv313

# 作成（現在の pyenv バージョンから）
pyenv virtualenv myenv

# 一覧
pyenv virtualenvs

# 有効化 / 無効化
pyenv activate myenv
pyenv deactivate

# 自動アクティベート（カレント専用）
echo myenv > .python-version

# 削除
pyenv virtualenv-delete myenv
# or: pyenv uninstall myenv
```

`pyenv virtualenv` のオプションは **下層の作成コマンド（`virtualenv` / `venv` / `conda`）にフォワード**されます。利用可能なフラグは環境に依存するため、**`pyenv virtualenv --help`** で確認してください。([GitHub][6])

### よく使う環境変数

* `PYENV_VIRTUALENV_PROMPT`：プロンプト表示をカスタム（`({venv})` の `{venv}` に環境名が入る）。
* `PYENV_VIRTUALENV_VERBOSE_ACTIVATE`：有効化/無効化時に詳細表示。
* `PYENV_VIRTUALENV_CACHE_PATH` / `VIRTUALENV_VERSION` / `GET_PIP_URL` / `PIP_VERSION` など。([GitHub][6])

---

## pyenv-doctor：何者？どう使う？

* **役割**：`pyenv doctor` コマンドで **pyenv のセットアップや Python ビルドに必要なツール群が揃っているか診断**します。ビルドトラブルの事前検知に便利。([GitHub][7])
* **使い方**：

```bash
pyenv doctor
# 詳細ログで診断したい時
PYENV_DEBUG=1 pyenv doctor
```

（複雑なオプションはなく、実行して結果を読むタイプのツールです。）([GitHub][7], [Mike Bailey][8])

---

## 参考リンク

* `pyenv-virtualenv` 公式 README（使い方・挙動・環境変数） ([GitHub][6])
* `pyenv-doctor` 公式 README（導入と実行） ([GitHub][7])
* `pyenv-update` 公式 README（`pyenv update` の提供元） ([GitHub][5])
* Ansible タグと `always` 、`include_tasks` の挙動（公式 & 解説） ([docs.ansible.com][1], [Server Fault][3], [Stack Overflow][4])

このパッチで `pyenv update` まで通るはず。もしまだダメなら、`~/.pyenv/plugins` の中身（`pyenv-update` の有無）と `-vvv` の出力を貼ってください。そこからさらに詰めます。

[1]: https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_tags.html?utm_source=chatgpt.com "Tags — Ansible Community Documentation"
[2]: https://docs.ansible.com/ansible/latest/collections/ansible/builtin/include_tasks_module.html?utm_source=chatgpt.com "ansible.builtin.include_tasks module – Dynamically include a ..."
[3]: https://serverfault.com/questions/1023392/use-ansible-include-tasks-with-tags-on-the-sub-tasks?utm_source=chatgpt.com "Use Ansible include_tasks with tags on the sub-tasks"
[4]: https://stackoverflow.com/questions/65464394/ansible-include-tasks-will-not-run-when-tags-are-specified?utm_source=chatgpt.com "Ansible include_tasks will not run when tags are specified"
[5]: https://github.com/pyenv/pyenv-update?utm_source=chatgpt.com "update pyenv and plugins"
[6]: https://github.com/pyenv/pyenv-virtualenv "GitHub - pyenv/pyenv-virtualenv: a pyenv plugin to manage virtualenv (a.k.a. python-virtualenv)"
[7]: https://github.com/pyenv/pyenv-doctor?utm_source=chatgpt.com "pyenv/pyenv-doctor: Verify pyenv installation"
[8]: https://mike.bailey.net.au/notes/software/languages/python/pyenv/pyenv-doctor/?utm_source=chatgpt.com "pyenv doctor - mbailey/notes - Mike Bailey"
