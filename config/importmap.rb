# Pin npm packages by running ./bin/importmap

pin "application"
pin "@rails/actioncable", to: "@rails--actioncable.js" # @8.0.100

pin_all_from "app/javascript/controllers", under: "controllers"

