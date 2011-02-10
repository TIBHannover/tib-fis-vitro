<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- List individuals in the requested class. -->

<#import "lib-list.ftl" as l>
${stylesheets.add("/css/browseIndex.css")}

<section class="individualList">
   <h2>${title} <span class="rdfLink"><a class="icon-rdf" href="${redirecturl}" title="View the ${title} list in RDF format">RDF</a></span></h2>
    <#if subtitle??>
        <h4>${subtitle}</h4>
    </#if>
    
    <#if message??>
        <p>${message}</p>
    <#else>
        <#assign pagination>
            <#if (pages?size > 1) >
                pages:
                <ul class="pagination">
                    <#list pages as page>
                        <#if page.selected>
                            <li class="selectedNavPage">${page.text}</li>
                        <#else>
                            <#-- RY Ideally the urls would be generated by the controller; see search-pagedResults.ftl -->
                            <li><a href="${urls.base}/individuallist?${page.param}&vclassId=${vclassId?url}">${page.text}</a></li>
                        </#if>
                    </#list>
                </ul>
            </#if>
        </#assign>
        
        ${pagination}
        
        <ul>
            <#list individuals as individual>
                <li>
                    <#assign moniker = individual.moniker!>
                    <a href="${individual.profileUrl}">${individual.name}</a><#if moniker?has_content> <span class="moniker">${moniker}</span></#if>
                    <#assign links = individual.links>
                    <#if links?has_content>
                        <ul class="individualData">
                            <@l.firstLastList>
                                <#list links as link>
                                    <li><a class="externalLink" href="${link.url}">${link.anchor}</a></li>
                                </#list>
                            </@l.firstLastList>
                        </ul>
                    </#if>
                </li>
            </#list>
        </ul>
        
        ${pagination}
    </#if>
</section> <!-- .individualList -->