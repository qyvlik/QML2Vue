/**
 * Created by qyvlik on 2016/9/15.
 */
(function(exports){

    // 自定义 v-time 指令
    Vue.directive('time', {
       bind: function() {

       },
        update: function(value) {
            var self = this;
            this.el.innerHTML = new Date(value);
            this.timeout = setInterval(function(){
               self.el.innerHTML = new Date(value);
            }, 60000);
        },
        unbind: function(){
            clearInterval(this.timeout);
        }
    });

    var tdlist_filters = {
        all: function(list) {
            return list;
        },
        active: function(list) {
            var lstem = list.filter(function(todo){
                return !todo.status;
            });
            return lstem;
        },
        completed: function(list) {
            var lstem = list.filter(function(todo){
                return todo.status;
            });
            return lstem;
        }
    };

    exports.app = new Vue({
        el: '#app',
        data: {
            tdlist: JSON.parse(localStorage.getItem('list')) || [],
            todo_new: '',
            tdtype: "all"
        },
        computed: {
            // 计算
            filterList: function() {
                return tdlist_filters[this.tdtype](this.tdlist);
            },
            nleft_count: function() {
                var count = 0;
                for(var i = 0; i < this.tdlist.length; i++) {
                    if(this.tdlist[i].status == 0) {
                        count += 1;
                    }
                }
                return count;
            }
        },
        methods: {
            add_todo: function() {
                var atem = {
                    title: this.todo_new,
                    status: 0,
                    time: Date.now()
                };
                this.tdlist.push(atem);
                this.todo_new = '';
            },
            del_todo: function(index) {
                var item = this.tdlist[index];
                this.tdlist.$remove(item);
                // this.tdlist.splice(index, 1);
            },
            toggle_todo: function(index) {
                var item = this.tdlist[index];
                item.status = item.status == 0 ? 1: 0;
            },
            change_type: function(stype) {
                this.tdtype = stype;
            },
            clear_completed: function() {
                this.tdlist = tdlist_filters.active(this.tdlist);
            }
        },
        watch: {
            tdlist: {
                handler: function(list) {
                    localStorage.setItem('list', JSON.stringify(list));
                },
                deep: true
            }
        }
    });

})(window);
