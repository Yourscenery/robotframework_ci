# -*- coding: utf-8 -*-


from configparser import ConfigParser
import os
import os.path


class Config:
    def __init__(self):
        self.config = ConfigParser()
        self.conf_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "config.ini")

        if not os.path.exists(self.conf_path):
            raise FileNotFoundError("找不到配置文件config.ini")
        self.config.read(self.conf_path)

        _S_MYSQL = "mysql"
        _S_SSH = "ssh"
        _S_WEB = "web"
        _S_MAIL = "mail"
        _HOST = "host"
        _PORT = "port"
        _USERNAME = "username"
        _PASSWORD = "password"
        _DATABASE = "database"
        _SENDER = "sender"
        _RECEIVER = "receiver"
        _SMTPSERVER = "smtpserver"

        self.mysql_host = self.config.get(_S_MYSQL, _HOST)
        self.mysql_port = self.config.get(_S_MYSQL, _PORT)
        self.mysql_username = self.config.get(_S_MYSQL, _USERNAME)
        self.mysql_password = self.config.get(_S_MYSQL, _PASSWORD)
        self.mysql_database = self.config.get(_S_MYSQL, _DATABASE)

        self.web_host = self.config.get(_S_WEB, _HOST)
        self.web_username = self.config.get(_S_WEB, _USERNAME)
        self.web_password = self.config.get(_S_WEB, _PASSWORD)

        self.ssh_host = self.config.get(_S_SSH, _HOST)
        self.ssh_port = self.config.get(_S_SSH, _PORT)
        self.ssh_username = self.config.get(_S_SSH, _USERNAME)
        self.ssh_password = self.config.get(_S_SSH, _PASSWORD)

        self.mail_sender = self.config.get(_S_MAIL, _SENDER)
        self.mail_receiver = self.config.get(_S_MAIL, _RECEIVER)
        self.mail_smtpserver = self.config.get(_S_MAIL, _SMTPSERVER)
        self.mail_username = self.config.get(_S_MAIL, _USERNAME)
        self.mail_password = self.config.get(_S_MAIL, _PASSWORD)

    def add_conf(self, section, key, value):
        self.config.add_section(section)
        self.config.set(section, key, value)
        with open(self.conf_path, "w+") as f:
            return self.config.write(f)

    def set_conf(self, section, key, value):
        self.config.set(section, key, value)
        with open(self.conf_path, "w+") as f:
            return self.config.write(f)

    def get_conf(self):
        self.config.read(self.conf_path, encoding="utf-8")
        conf = {}
        for section in self.config.sections():
            conf[section] = dict(self.config.items(section))
        return conf

    def get_conf_by_section(self, section):
        self.config.read(self.conf_path, encoding="utf-8")
        if section in self.config.sections():
            conf = self.config[section]
            return conf
        else:
            raise KeyError(section, "section值不存在")

    def get_conf_by_key(self, section, key):
        self.config.read(self.conf_path, encoding="utf-8")
        if section in self.config.sections():
            if key in self.config[section]:
                conf = self.config[section][key]
                return conf
            else:
                raise KeyError(key, "key值不存在")
        else:
            raise KeyError(section, "section值不存在")


if __name__ == "__main__":
    con = Config()
    # print(con.get_conf())
    print(con.web_host)
