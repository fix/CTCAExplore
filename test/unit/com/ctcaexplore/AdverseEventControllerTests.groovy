package com.ctcaexplore



import org.junit.*
import grails.test.mixin.*

@TestFor(AdverseEventController)
@Mock(AdverseEvent)
class AdverseEventControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/adverseEvent/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.adverseEventInstanceList.size() == 0
        assert model.adverseEventInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.adverseEventInstance != null
    }

    void testSave() {
        controller.save()

        assert model.adverseEventInstance != null
        assert view == '/adverseEvent/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/adverseEvent/show/1'
        assert controller.flash.message != null
        assert AdverseEvent.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/adverseEvent/list'

        populateValidParams(params)
        def adverseEvent = new AdverseEvent(params)

        assert adverseEvent.save() != null

        params.id = adverseEvent.id

        def model = controller.show()

        assert model.adverseEventInstance == adverseEvent
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/adverseEvent/list'

        populateValidParams(params)
        def adverseEvent = new AdverseEvent(params)

        assert adverseEvent.save() != null

        params.id = adverseEvent.id

        def model = controller.edit()

        assert model.adverseEventInstance == adverseEvent
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/adverseEvent/list'

        response.reset()

        populateValidParams(params)
        def adverseEvent = new AdverseEvent(params)

        assert adverseEvent.save() != null

        // test invalid parameters in update
        params.id = adverseEvent.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/adverseEvent/edit"
        assert model.adverseEventInstance != null

        adverseEvent.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/adverseEvent/show/$adverseEvent.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        adverseEvent.clearErrors()

        populateValidParams(params)
        params.id = adverseEvent.id
        params.version = -1
        controller.update()

        assert view == "/adverseEvent/edit"
        assert model.adverseEventInstance != null
        assert model.adverseEventInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/adverseEvent/list'

        response.reset()

        populateValidParams(params)
        def adverseEvent = new AdverseEvent(params)

        assert adverseEvent.save() != null
        assert AdverseEvent.count() == 1

        params.id = adverseEvent.id

        controller.delete()

        assert AdverseEvent.count() == 0
        assert AdverseEvent.get(adverseEvent.id) == null
        assert response.redirectedUrl == '/adverseEvent/list'
    }
}
