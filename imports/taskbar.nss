menu(where=@(this.count == 0) type='taskbar' image=icon.settings expanded=true)
{
	item(title=title.control_panel image=\uE0F3 cmd='shell:::{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}')
	item(title="Task Manager" sep=both image=icon.task_manager cmd='taskmgr.exe')
	item(title="Taskbar Settings" sep=both image=inherit cmd='ms-settings:taskbar')
	item(title="Task Scheduler" sep=both image=\uE1F2 cmd='taskschd.msc')
	item(vis=key.shift() title="Reboot Explorer" cmd=command.restart_explorer)
}