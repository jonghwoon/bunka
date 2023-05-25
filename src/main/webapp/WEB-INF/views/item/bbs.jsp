<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="setting.jsp" %>
    <style>

    </style>

    <script type="text/javascript">
        $(document).ready(function() {
            $("#mytable #checkall").click(function() {
                if ($("#mytable #checkall").is(':checked')) {
                    $("#mytable input[type=checkbox]").each(function() {
                        $(this).prop("checked", true);
                    });

                } else {
                    $("#mytable input[type=checkbox]").each(function() {
                        $(this).prop("checked", false);
                    });
                }
            });

            $("[data-toggle=tooltip]").tooltip();
        });
        
     // Starrr plugin (https://github.com/dobtco/starrr)
        var __slice = [].slice;

        (function($, window) {
          var Starrr;

          Starrr = (function() {
            Starrr.prototype.defaults = {
              rating: void 0,
              numStars: 5,
              change: function(e, value) {}
            };

            function Starrr($el, options) {
              var i, _, _ref,
                _this = this;

              this.options = $.extend({}, this.defaults, options);
              this.$el = $el;
              _ref = this.defaults;
              for (i in _ref) {
                _ = _ref[i];
                if (this.$el.data(i) != null) {
                  this.options[i] = this.$el.data(i);
                }
              }
              this.createStars();
              this.syncRating();
              this.$el.on('mouseover.starrr', 'span', function(e) {
                return _this.syncRating(_this.$el.find('span').index(e.currentTarget) + 1);
              });
              this.$el.on('mouseout.starrr', function() {
                return _this.syncRating();
              });
              this.$el.on('click.starrr', 'span', function(e) {
                return _this.setRating(_this.$el.find('span').index(e.currentTarget) + 1);
              });
              this.$el.on('starrr:change', this.options.change);
            }

            Starrr.prototype.createStars = function() {
              var _i, _ref, _results;

              _results = [];
              for (_i = 1, _ref = this.options.numStars; 1 <= _ref ? _i <= _ref : _i >= _ref; 1 <= _ref ? _i++ : _i--) {
                _results.push(this.$el.append("<span class='glyphicon .glyphicon-star-empty'></span>"));
              }
              return _results;
            };

            Starrr.prototype.setRating = function(rating) {
              if (this.options.rating === rating) {
                rating = void 0;
              }
              this.options.rating = rating;
              this.syncRating();
              return this.$el.trigger('starrr:change', rating);
            };

            Starrr.prototype.syncRating = function(rating) {
              var i, _i, _j, _ref;

              rating || (rating = this.options.rating);
              if (rating) {
                for (i = _i = 0, _ref = rating - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
                  this.$el.find('span').eq(i).removeClass('glyphicon-star-empty').addClass('glyphicon-star');
                }
              }
              if (rating && rating < 5) {
                for (i = _j = rating; rating <= 4 ? _j <= 4 : _j >= 4; i = rating <= 4 ? ++_j : --_j) {
                  this.$el.find('span').eq(i).removeClass('glyphicon-star').addClass('glyphicon-star-empty');
                }
              }
              if (!rating) {
                return this.$el.find('span').removeClass('glyphicon-star').addClass('glyphicon-star-empty');
              }
            };

            return Starrr;

          })();
          return $.fn.extend({
            starrr: function() {
              var args, option;

              option = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
              return this.each(function() {
                var data;

                data = $(this).data('star-rating');
                if (!data) {
                  $(this).data('star-rating', (data = new Starrr($(this), option)));
                }
                if (typeof option === 'string') {
                  return data[option].apply(data, args);
                }
              });
            }
          });
        })(window.jQuery, window);

        $(function() {
          return $(".starrr").starrr();
        });

        $( document ).ready(function() {
              
          $('#stars').on('starrr:change', function(e, value){
            $('#count').html(value);
          });
          
          $('#stars-existing').on('starrr:change', function(e, value){
            $('#count-existing').html(value);
          });
        });
    </script>

    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>

    <body>

        <div class="container">
            <div class="row">


                <div class="col-md-12">
                    <h4>독자서평</h4>
                    <div class="table-responsive">
                        <p data-placement="top" data-toggle="tooltip" title="Edit">
                            <button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit">
                                <span class="glyphicon glyphicon-pencil"></span>
                            </button>
                        </p>

                        <table id="mytable" class="table table-bordred table-striped">

                            <thead>
                                <th>No.</th>
                                <th>작성자</th>
                                <th>제목</th>
                                <th>별점</th>
                                <th>조회수</th>
                                <th>ip</th>
                            </thead>
                            <tbody>

                                <tr>
                                    <td>1</td>

                                    <td>작성맨</td>
                                    <td>
                                    	<a href="#">제목이 길이에 맞춰 조절되는건가</a>
                                    </td>
                                    <td>★★★★★</td>
                                    <td>10</td>
                                    <td>192.168.0.2</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>작성맨</td>
                                    <td>제목이 길이에 맞춰 조절되는건가</td>
                                    <td>
								    <div id="stars-existing" class="starrr" data-rating='4'></div>
								    </td>
                                    <td>10</td>
                                    <td>192.168.0.2</td>
                                </tr>

                            </tbody>

                        </table>

                        <div class="clearfix"></div>
                        <ul class="pagination pull-right">
                            <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
                            <li class="active"><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
                        </ul>

                    </div>

                </div>
            </div>
        </div>


        <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                        <h4 class="modal-title custom_align" id="Heading">Edit Your Detail</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <input class="form-control " type="text" placeholder="Mohsin">
                        </div>
                        <div class="form-group">

                            <input class="form-control " type="text" placeholder="Irshad">
                        </div>
                        <div class="form-group">
                            <textarea rows="2" class="form-control" placeholder="CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan"></textarea>


                        </div>
                    </div>
                    <div class="modal-footer ">
                        <button type="button" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Update</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>



        <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                        <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
                    </div>
                    <div class="modal-body">

                        <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>

                    </div>
                    <div class="modal-footer ">
                        <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
    </body>

    </html>