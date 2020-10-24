resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description "Schinken Better Drugs System"

version "1.0"

client_script {
    "client.lua",
    "@es_extended/locale.lua"
}

sever_script {
    "server.lua",
    "@es_extended/locale.lua"
}

dependencies "es_extended"