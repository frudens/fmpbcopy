# fmpbcopy

## ダウンロードと準備

1. [Releases](https://github.com/frudens/fmpbcopy/releases) ページからコマンドの実行ファイル [Products.zip](https://github.com/frudens/fmpbcopy/releases/download/v0.1/Products.zip) をダウンロードします。

2. ダウンロードした `Products.zip` を解凍し `fmpbcopy` を一度右クリックで開いてください。

3. `“fmpbcopy”の開発元を検証できません。開いてもよろしいですか?` とダイアログが表示されます。

4. `開く` を選択すると、ターミナルが起動し、すぐに終了します。

5. これで準備は完了です。

6. 分かる人は、ご自身で管理しているパスにバイナリを移動してください。

## 使い方

1. [fmpbpaste](https://github.com/frudens/fmpbpaste)コマンドなどで取得したFileMakerのXMLをコピーします。

2. ターミナルを起動し `pbpaste | fmpbcopy -` を実行します。

3. 以下のように、出力されます。

```bash
(ins) teruhiro@MacBook-Pro-13:~ $ pbpaste | Downloads/Products/usr/local/bin/fmpbcopy -
Succeeded in saving the clipboard.
```

4. FileMakerに貼り付けてください。

## 色々な使い方

1. ファイルの内容を渡す。

```bash
(ins) teruhiro@MacBook-Pro-13:~ $ cat field.xml
<?xml version="1.0" encoding="utf8"?>
<fmxmlsnippet type="FMObjectList">
  <Field id="1" dataType="Text" fieldType="Normal" name="名前">
    <Comment/>
    <AutoEnter allowEditing="True" constant="False" furigana="False" lookup="False" calculation="False">
      <ConstantData/>
    </AutoEnter>
    <Validation message="False" maxLength="False" valuelist="False" calculation="False" alwaysValidateCalculation="False" type="OnlyDuringDataEntry">
      <NotEmpty value="False"/>
      <Unique value="False"/>
      <Existing value="False"/>
      <StrictValidation value="False"/>
    </Validation>
    <Storage autoIndex="True" index="None" indexLanguage="Japanese" global="False" maxRepetition="1"/>
    <DefaultStyle/>
  </Field>
</fmxmlsnippet>
(ins) teruhiro@MacBook-Pro-13:~ $ cat field.xml | Downloads/Products/usr/local/bin/fmpbcopy -
Succeeded in saving the clipboard.
```

2. 引数を \`\` や $() で渡す。

```bash
(ins) teruhiro@MacBook-Pro-13:~ $ fmpbcopy `cat field.xml`
Succeeded in saving the clipboard.

(ins) teruhiro@MacBook-Pro-13:~ $ fmpbcopy $(cat field.xml)
Succeeded in saving the clipboard.
```

