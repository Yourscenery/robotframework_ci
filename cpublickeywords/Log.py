# -*- coding: utf-8 -*-


import logging
import time
import os
import os.path


class MyLog:
    LEVELS = {
        'debug': logging.DEBUG,
        'info': logging.INFO,
        'warning': logging.WARNING,
        'error': logging.ERROR,
        'critical': logging.CRITICAL
    }

    logger = logging.getLogger()
    level = 'default'

    def create_file(self, filename):
        path = filename[0:filename.rfind('/')]
        if not os.path.isdir(path):
            os.makedirs(path)
        if not os.path.isfile(filename):
            fd = open(filename, mode='w', encoding='utf-8')
            fd.close()
        else:
            pass

    def set_handler(self, levels):
        if levels == 'error':
            self.logger.addHandler(MyLog.err_handler)
        self.logger.addHandler(MyLog.handler)

    def remove_handler(self, levels):
        if levels == 'error':
            self.logger.removeHandler(MyLog.err_handler)
        self.logger.removeHandler(MyLog.handler)

    def get_current_time(self):
        return time.strftime(MyLog.date, time.localtime(time.time()))

    path = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    log_file = path + '/Log/log.log'
    err_file = path + '/Log/err.log'
    logger.setLevel(LEVELS.get(level, logging.NOTSET))
    create_file(log_file)
    create_file(err_file)
    date = '%Y-%m-%d %H:%M:%S'

    handler = logging.FileHandler(log_file, encoding='utf-8')
    err_handler = logging.FileHandler(err_file, encoding='utf-8')

    @staticmethod
    def debug(self, log_meg):
        self.set_handler('debug')
        self.logger.debug("[DEBUG " + self.get_current_time() + "]" + log_meg)
        self.remove_handler('debug')

    @staticmethod
    def info(self, log_meg):
        self.set_handler('info')
        self.logger.info("[INFO " + self.get_current_time() + "]" + log_meg)
        self.remove_handler('info')

    @staticmethod
    def warning(self, log_meg):
        self.set_handler('warning')
        self.logger.warning("[WARNING " + self.get_current_time() + "]" + log_meg)
        self.remove_handler('warning')

    @staticmethod
    def error(self, log_meg):
        self.set_handler('error')
        self.logger.error("[ERROR " + self.get_current_time() + "]" + log_meg)
        self.remove_handler('error')

    @staticmethod
    def critical(self, log_meg):
        self.set_handler('critical')
        self.logger.error("[CRITICAL " + self.get_current_time() + "]" + log_meg)
        self.remove_handler('critical')


if __name__ == "__main__":
    MyLog.debug("This is debug message")
    MyLog.info("This is info message")
    MyLog.warning("This is warning message")
    MyLog.error("This is error")
    MyLog.critical("This is critical message")
