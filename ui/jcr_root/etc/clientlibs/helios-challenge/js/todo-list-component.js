//Angular function
var tasks = [ 
	{
		code: '001',
		name: 'Implement Javascript logic',
		completed: false
	},
	{
		code: '002',
		name: 'Implement tasks service',
		completed: false
	},
	{
		code: '003',
		name: 'Finish AEM stuff',
		completed: true
	},
	{
		code: '004',
		name: 'Put the css styles',
		completed: false
	},
	{
		code: '005',
		name: 'Implement data source for todo list',
		completed: false
	},
	{
		code: '006',
		name: 'Meke some test',
		completed: false
	},
	{
		code: '007',
		name: 'Meke some test',
		completed: false
	},
	{
		code: '008',
		name: 'Meke some test',
		completed: false
	}
]

var app = angular.module('helios-challenge', ['angularUtils.directives.dirPagination']);

app.controller('TodoListComponentController',['$http','$filter',function($http,$filter){
	var todoListController = this;
	this.tasks = tasks;
    this.newTask = "";
    this.listMode = "";

    this.pendingTasks = function(){
		return calculatePendingTasks(this.tasks);
	};

    this.tasksToList = function(){
        var filtro = {};
        if(todoListController.listMode == "active"){
            filtro.completed = false;
        }else if(todoListController.listMode == "completed"){
            filtro.completed = true;
        }
        return $filter('filter')(todoListController.tasks,filtro,true);
    };

    this.setListMode = function(listMode){
		todoListController.listMode = listMode;
    };

    this.addTask = function(){
        if( todoListController.newTask.trim()  != ""){
            var taskObject= {};
            taskObject.name = todoListController.newTask;
            taskObject.completed = false;
            todoListController.tasks.unshift(taskObject);
            todoListController.newTask = "";
        }
    };
    this.clearCompleted = function(){
		var completedTasks = []; 
        var filtro = {};
        filtro.completed = true;
        completedTasks = $filter('filter')(todoListController.tasks,filtro,true);

        filtro.completed = false;
        todoListController.tasks = $filter('filter')(todoListController.tasks,filtro,true);
    };
}]);

//Util Functions
calculatePendingTasks = function(tasks){
	var pendingTasks = 0;
	tasks.forEach(function(task, i){
		pendingTasks = !task.completed ? pendingTasks+1 : pendingTasks;
	});
	return pendingTasks;
}

