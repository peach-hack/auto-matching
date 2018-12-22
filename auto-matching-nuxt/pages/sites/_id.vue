<template lang="pug">
b-card
  form
    .form-group
      label ログインID
      input.form-control(type="text" placeholder="LoginId")
    .form-group
      label ログインパスワード
      input.form-control(type="text" placeholder="Password")
    fieldset.form-group
      .row
        legend.col-form-label.col-sm-2.pt-0
          | 操作対象
        .col-sm-10
          .form-check
            input.form-check-input(type="radio" name="activate" value="option1" checked)
            | 有効
          .form-check
            input.form-check-input(type="radio" name="deactivate" value="option1")
            | 無効
    button(type="button submit").btn.btn-primary
      | Submit
    nuxt-link(to="/sites")
      button(type="button").btn.btn-light
        | Cancel
</template>
