function RemoteForm(form_id){
  this.form = $('#'+form_id);
  this.input = this.form.find('input[type=text]');
  this.loading = $('<div id="loading" style="display:none;"><p class="loading">Loading your results</p></div>');
  this.messages = ["Getting neighbours' top artists","Getting your library","Complicated logic","Head scratching","Making tea","Still thinking about it", "Answer coming soon"];
  var _this = this;
  this.form.submit(function(ev){
    _this.count = 0;
    if(_this.input.val() == ''){
      var error = _this.form.find('p.error').length < 1 ? $('<p class="error" style="display:none;">Please enter your username</p>') : _this.form.find('p.error');
      _this.form.append(error);
      error.fadeIn();
      return false;
    } else {
      $.post(_this.form[0].action+'.js',_this.form.serialize(),function(data){
        eval(data);
      });
      $('div#intro, p#asterisk, form').fadeOut();
      _this.loading.append('<p id="currently">Getting neighbours</p>');
      _this.setUpdater();
      $('#header').after(_this.loading);
      _this.loading.fadeIn();
      _this.loading.ajaxError(function(event, request, settings){
        $(this).hide();
        var error = _this.form.find('p.error500').length < 1 ? $('<p class="error500" style="display:none;">Your username appears to be wrong or there is another problem.</p>') : _this.form.find('p.error500');
        _this.form.append(error);
        $('div#intro, p#asterisk, form').fadeIn();
        error.fadeIn()
      });
      return false;
    }
  })
}

RemoteForm.prototype.setUpdater = function(){
  var _this = this;
  this.interval = setInterval(function(){
    _this.updateLoading();
  },5000);
}

RemoteForm.prototype.updateLoading = function(){
  var _this = this;
  if(this.count < this.messages.length){
    this.loading.find('p:last').queue(function(){
      $(this).fadeOut();
      $(this).dequeue(); 
    }).queue(function(){
      $(this).text(_this.messages[_this.count]);
      $(this).dequeue();
    }).queue(function(){
      $(this).fadeIn();
      $(this).dequeue();
      _this.count += 1;
    });
  }
}

$(function(){
  f = new RemoteForm('the_form');
})