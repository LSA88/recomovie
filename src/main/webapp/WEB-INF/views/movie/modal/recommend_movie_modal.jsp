<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <style>
    #recommend_movie_modal .col-xs-3{
    width: 20%;
    }
    
    </style>
<div class="modal fade" id="recommend_movie_modal"  tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document" style="width: 1024px;">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" style="font-size: 30px; font-weight: bold;">추천영화 목록</h5>
      </div>
      <div class="modal-body" style="height: 500px;
    overflow-y: auto;">
        <div class="row recommend_movie_row col-xs-12" >


		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>