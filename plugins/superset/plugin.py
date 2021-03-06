from app.plugins import PluginBase, Menu, MountPoint
from django.shortcuts import render

class Plugin(PluginBase):

    def main_menu(self):
        return [Menu("数据智能", self.public_url(""), "fa fa-file-o fa-fw")]

    def app_mount_points(self):
        return [
            MountPoint('$', lambda request: render(request, self.template_path("app.html"), {'title': 'Data View'}))
        ]


