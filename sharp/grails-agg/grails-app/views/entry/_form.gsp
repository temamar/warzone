<%@ page import="com.sharp.agg.feed.Entry" %>



<div class="fieldcontain ${hasErrors(bean: instance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="entry.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" maxlength="250" required="" value="${instance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: instance, field: 'link', 'error')} required">
	<label for="link">
		<g:message code="entry.link.label" default="Link" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="link" cols="40" rows="5" maxlength="500" required="" value="${instance?.link}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: instance, field: 'contents', 'error')} required">
	<label for="contents">
		<g:message code="entry.contents.label" default="Contents" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="contents" cols="40" rows="5" maxlength="4000" required="" value="${instance?.contents}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: instance, field: 'postedOn', 'error')} required">
	<label for="postedOn">
		<g:message code="entry.postedOn.label" default="Posted On" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="postedOn" precision="day"  value="${instance?.postedOn}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: instance, field: 'feed', 'error')} required">
	<label for="feed">
		<g:message code="entry.feed.label" default="Feed" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="feed" name="feed.id" from="${com.sharp.agg.feed.Feed.list()}" optionKey="id" required="" value="${instance?.feed?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: instance, field: 'tags', 'error')} ">
	<label for="tags">
		<g:message code="entry.tags.label" default="Tags" />
		
	</label>
	<g:select name="tags" from="${com.sharp.agg.feed.Tag.list()}" multiple="multiple" optionKey="id" size="5" value="${instance?.tags*.id}" class="many-to-many"/>
</div>
